from PIL import Image, ImageFilter
from enum import Enum
import argparse
import sys
import os
import traceback


class Colors(Enum):
    teletex = 'teletex'
    apple2 = 'apple2'
    atari2600 = 'atari'

    def __str__(self):
        return self.value


class CGA(Enum):
    full = 'full'
    palette_0_low = '0_low'
    palette_0_high = '0_high'
    palette_1_low = '1_low'
    palette_1_high = '1_high'
    mode_5_low = 'mode_5_low'
    mode_5_high = 'mode_5_high'

    def __str__(self):
        return self.value

    @staticmethod
    def from_string(s):
        try:
            return Colors[s]
        except KeyError:
            raise ValueError()


try:
    parser = argparse.ArgumentParser()
    parser.add_argument("filename",
                        help="the original image file",
                        type=argparse.FileType('r'))
    parser.add_argument('--small',
                        dest='smallpic',
                        help='save small picture',
                        action='store_true')
    parser.add_argument('--no-small',
                        dest='smallpic',
                        help='do not save small picture (default)',
                        action='store_false')
    parser.add_argument('--dither',
                        dest='dither',
                        help='dither picture',
                        action='store_true')
    parser.add_argument('--no-dither',
                        dest='dither',
                        help='do not dither picture (default)',
                        action='store_false')
    parser.add_argument('--color',
                        help='generate color picture (default)',
                        action='store_true')
    parser.add_argument('--grayscale',
                        help='generate grayscale picture',
                        action='store_true')
    parser.add_argument('--bw',
                        help='generate Black & White picture',
                        action='store_true')
    parser.add_argument('--cga',
                        help='generate picture using CGA palette',
                        nargs='?',
                        type=CGA,
                        choices=list(CGA))
    parser.add_argument('--palette',
                        nargs='?',
                        help='define how many colors should we use',
                        type=Colors,
                        choices=list(Colors))
    parser.set_defaults(smallpic=False)
    parser.set_defaults(dither=False)
    args = parser.parse_args()

    file = sys.argv[1]
    filename, file_extension = os.path.splitext(file)

    if args.cga is None and args.palette is None and not args.grayscale and not args.bw:
        print('Processing {0} with NES colors ...'.format(
            sys.argv[1]))

    if args.palette == Colors.teletex:
        print('Processing {0} with Teletex ...'.format(
            sys.argv[1]))

    if args.palette == Colors.apple2:
        print('Processing {0} with Apple II ...'.format(
            sys.argv[1]))

    if args.palette == Colors.atari2600:
        print('Processing {0} with Atari 2600 ...'.format(
            sys.argv[1]))

    if args.cga == CGA.full:
        print('Processing {0} with 16 CGA colors ...'.format(
            sys.argv[1]))

    if args.cga == CGA.palette_0_low:
        print('Processing {0} with CGA palette 0 low ...'.format(
            sys.argv[1]))

    if args.cga == CGA.palette_0_high:
        print('Processing {0} with CGA palette 0 high ...'.format(
            sys.argv[1]))

    if args.cga == CGA.palette_1_low:
        print('Processing {0} with CGA palette 1 low ...'.format(
            sys.argv[1]))

    if args.cga == CGA.palette_1_high:
        print('Processing {0} with CGA palette 1 high ...'.format(
            sys.argv[1]))

    if args.cga == CGA.mode_5_low:
        print('Processing {0} with CGA mode 5 0 low ...'.format(
            sys.argv[1]))

    if args.cga == CGA.mode_5_high:
        print('Processing {0} with CGA mode 5 high ...'.format(
            sys.argv[1]))

    if args.grayscale:
        print('Processing {0} in grayscale ...'.format(sys.argv[1]))

    if args.bw:
        print('Processing {0} in Black & White ...'.format(sys.argv[1]))

    img = Image.open(file).convert('RGB')
    img.thumbnail((150, 150))  # resize and maintain aspect ratio

    if args.smallpic:
        img.save(filename + ".small.png", "PNG")

    # create palette image with NES color palette
    palettedata = [124, 124, 124,
                   0, 0, 252,
                   0, 0, 188,
                   68, 40, 188,
                   148, 0, 132,
                   168, 0, 32,
                   168, 16, 0,
                   136, 20, 0,
                   80, 48, 0,
                   0, 120, 0,
                   0, 104, 0,
                   0, 88, 0,
                   0, 64, 88,
                   0, 0, 0,
                   0, 0, 0,
                   0, 0, 0,
                   188, 188, 188,
                   0, 120, 248,
                   0, 88, 248,
                   104, 68, 252,
                   216, 0, 204,
                   228, 0, 88,
                   248, 56, 0,
                   228, 92, 16,
                   172, 124, 0,
                   0, 184, 0,
                   0, 168, 0,
                   0, 168, 68,
                   0, 136, 136,
                   0, 0, 0,
                   0, 0, 0,
                   0, 0, 0,
                   248, 248, 248,
                   60, 188, 252,
                   104, 136, 252,
                   152, 120, 248,
                   248, 120, 248,
                   248, 88, 152,
                   248, 120, 88,
                   252, 160, 68,
                   248, 184, 0,
                   184, 248, 24,
                   88, 216, 84,
                   88, 248, 152,
                   0, 232, 216,
                   120, 120, 120,
                   0, 0, 0,
                   0, 0, 0,
                   252, 252, 252,
                   164, 228, 252,
                   184, 184, 248,
                   216, 184, 248,
                   248, 184, 248,
                   248, 164, 192,
                   240, 208, 176,
                   252, 224, 168,
                   248, 216, 120,
                   216, 248, 120,
                   184, 248, 184,
                   184, 248, 216,
                   0, 252, 252,
                   248, 216, 248,
                   0, 0, 0,
                   0, 0, 0]
    palette_img = Image.new('P', (8, 8))
    palette_img.putpalette(palettedata * 4)

    if args.cga == CGA.full:
        palettedata = [0, 0, 0,
                       0, 0, 170,
                       0, 170, 0,
                       0, 170, 170,
                       170, 0, 0,
                       170, 0, 170,
                       170, 85, 0,
                       170, 170, 170,
                       85, 85, 85,
                       85, 85, 255,
                       85, 255, 85,
                       85, 255, 255,
                       255, 85, 85,
                       255, 85, 255,
                       255, 255, 85,
                       255, 255, 255]
        palimage = Image.new('P', (32, 32))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.cga == CGA.palette_0_low:
        palettedata = [0, 0, 0,
                       0, 170, 0,
                       170, 0, 0,
                       170, 85, 0]
        palimage = Image.new('P', (2, 2))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.cga == CGA.palette_0_high:
        palettedata = [0, 0, 0,
                       85, 255, 85,
                       255, 85, 85,
                       255, 255, 85]
        palimage = Image.new('P', (2, 2))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.cga == CGA.palette_1_low:
        palettedata = [0, 0, 0,
                       0, 170, 170,
                       170, 0, 170,
                       170, 170, 170]
        palimage = Image.new('P', (2, 2))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.cga == CGA.palette_1_high:
        palettedata = [0, 0, 0,
                       85, 255, 255,
                       255, 85, 255,
                       255, 255, 255]
        palimage = Image.new('P', (2, 2))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.cga == CGA.mode_5_low:
        palettedata = [0, 0, 0,
                       0, 170, 170,
                       170, 0, 0,
                       170, 170, 170]
        palimage = Image.new('P', (2, 2))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.cga == CGA.mode_5_high:
        palettedata = [0, 0, 0,
                       85, 255, 255,
                       255, 85, 85,
                       255, 255, 255]
        palimage = Image.new('P', (2, 2))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.palette == Colors.teletex:
        palettedata = [0, 0, 0,
                       0, 54, 247,
                       0, 247, 63,
                       0, 251, 253,
                       255, 51, 40,
                       255, 45, 249,
                       255, 251, 75,
                       255, 255, 255]
        palimage = Image.new('P', (4, 2))
        palimage.putpalette(palettedata * 32)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.palette == Colors.apple2:
        palettedata = [0, 0, 0,
                       114, 38, 64,
                       64, 51, 127,
                       228, 52, 254,
                       14, 89, 64,
                       128, 128, 128,
                       27, 154, 254,
                       191, 179, 255,
                       64, 76, 0,
                       228, 101, 1,
                       128, 128, 128,
                       241, 166, 191,
                       27, 203, 1,
                       191, 204, 128,
                       141, 217, 191,
                       255, 255, 255]
        palimage = Image.new('P', (4, 4))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.palette == Colors.atari2600:
        palettedata = [64, 64, 64,
                       100, 100, 16,
                       132, 68, 20,
                       152, 52, 24,
                       156, 32, 32,
                       140, 32, 116,
                       96, 32, 144,
                       42, 32, 152,
                       28, 32, 156,
                       28, 56, 144,
                       28, 76, 120,
                       28, 92, 72,
                       32, 92, 32,
                       52, 92, 28,
                       76, 80, 28,
                       100, 72, 24]
        palimage = Image.new('P', (4, 4))
        palimage.putpalette(palettedata * 16)
        img = img.quantize(colors=4, method=1, palette=palimage).convert('RGB')

    if args.dither:
        quantized = img.quantize(
            colors=args.palette, method=1, palette=palette_img)
        print("dithering ...")
    else:
        quantized = img

    quantized.save(filename + ".quantized.png", "PNG")

    mode = 'P'

    if args.color:
        mode = 'P'

    if args.grayscale:
        mode = 'L'

    if args.bw:
        mode = '1'

    # use `ImagingCore` directly to avoid dithering
    q = quantized.convert(mode, palette=palette_img.im, colors=args.palette)
    quantized = img._new(q.im)
    newimg = quantized.convert('RGB')
    newimg.save(filename + ".filtered.gif", "GIF")

except:
    e = sys.exc_info()[0]
    print(traceback.format_exc())
