#include <stddef.h>
#include <stdint.h>

// define PPU register aliases
#define PPU_CTRL *((uint8_t *)0x2000)
#define PPU_MASK *((uint8_t *)0x2001)
#define PPU_STATUS *((uint8_t *)0x2002)
#define PPU_SCROLL *((uint8_t *)0x2005)
#define PPU_ADDRESS *((uint8_t *)0x2006)
#define PPU_DATA *((uint8_t *)0x2007)

// define PPU memory addresses
#define PPU_PALETTE 0x3f00
#define PPU_NAMETABLE_0 0x2000
#define PPU_ATTRIB_0 0x23c0

// define palette color aliases
#define COLOR_BLACK 0x0f
#define COLOR_BLUE 0x12
#define COLOR_GREEN 0x1a
#define COLOR_RED 0x16
#define COLOR_WHITE 0x20
#define COLOR_YELLOW 0x28

// variables defined in assembly
extern uint8_t FrameCount;
#pragma zpsym("FrameCount");

#pragma bss - name(push, "ZEROPAGE")
size_t i;
uintptr_t ppu_addr;
uint8_t attr_offset;
#pragma bss - name(pop)

const char TEXT[] = "Ola, Calebe!";

const uint8_t PALETTE[] = {
    COLOR_BLUE,         // background color
    0, 0, COLOR_RED,    // background palette 0
    0,                  // ignored
    0, 0, COLOR_GREEN,  // background palette 1
    0,                  // ignored
    0, 0, COLOR_YELLOW, // background palette 2
    0,                  // ignored
    0, 0, COLOR_WHITE,  // background palette 3
};

const uint8_t ATTRIBUTES[] = {
    // layout 1
    0x00, // 00 00 00 00 or 0 0
          //                0 0
    0x90, // 10 01 00 00 or 0 0
          //                1 2
    0x40, // 01 00 00 00 or 0 0
          //                0 1
    0xe0, // 11 10 00 00 or 0 0
          //                2 3

    // layout 2
    0x80, // 10 00 00 00 or 0 0
          //                0 2
    0x40, // 01 00 00 00 or 0 0
          //                0 1
    0x20, // 00 10 00 00 or 0 0
          //                2 0
    0xd0, // 11 01 00 00 or 0 0
          //                1 3

    // layout 3
    0x40, // 01 00 00 00 or 0 0
          //                0 1
    0x20, // 00 10 00 00 or 0 0
          //                2 0
    0x90, // 10 01 00 00 or 0 0
          //                1 2
    0xc0, // 11 00 00 00 or 0 0
          //                0 3
};

/**
 * main() will be called at the end of the initialization code in reset.s.
 * Unlike C programs on a computer, it takes no arguments and returns no value.
 */
void main(void)
{
    // load the palette data into PPU memory $3f00-$3f1f
    PPU_ADDRESS = (uint8_t)(PPU_PALETTE >> 8);
    PPU_ADDRESS = (uint8_t)(PPU_PALETTE);

    for (i = 0; i < sizeof(PALETTE); ++i)
    {
        PPU_DATA = PALETTE[i];
    }

    // load the text sprites into the background (nametable 0)
    // nametable 0 is VRAM $2000-$23ff, so we'll choose an address in the
    // middle of the screen. The screen can hold a 32x30 grid of 8x8 sprites,
    // so an offset of 0x1ca (X: 10, Y:14) puts us around the middle vertically
    // and roughly centers our text horizontally.

    // A nametable is a 1024 byte area of memory used by the PPU to lay out backgrounds.
    // Each byte in the nametable controls one 8x8 pixel character cell,
    // and each nametable has 30 rows of 32 tiles each, for 960 ($3C0) bytes;
    // the rest is used by each nametable's attribute table.
    // The NES has four nametables, arranged in a 2x2 pattern.
    // Each occupies a 1 KiB chunk of PPU address space, starting at $2000 at the top left,
    // $2400 at the top right, $2800 at the bottom left, and $2C00 at the bottom right.
    ppu_addr = PPU_NAMETABLE_0 + 0x1ca;
    PPU_ADDRESS = (uint8_t)(ppu_addr >> 8);
    PPU_ADDRESS = (uint8_t)(ppu_addr);

    for (i = 0; i < sizeof(TEXT); ++i)
    {
        PPU_DATA = (uint8_t)TEXT[i];
    }

    // load the text attributes into the background (attributetable 0)
    // The attribute table is a 64-byte array at the end of
    // each nametable that controls which palette is assigned to
    // each part of the background.
    // Each attribute table, starting at $23C0, $27C0, $2BC0, or $2FC0,
    // is arranged as an 8x8 byte array.

    // Each byte controls the palette of a 32×32 pixel or 4×4 tile part
    // of the nametable and is divided into four 2-bit areas.
    // Each area covers 16×16 pixels or 2×2 tiles, the size of a [?]
    // block in Super Mario Bros. Given palette numbers topleft,
    // topright, bottomleft, bottomright, each in the range 0 to 3,
    // the value of the byte is:
    // value = (topleft << 0) | (topright << 2) | (bottomleft << 4) | (bottomright << 6)
    ppu_addr = PPU_ATTRIB_0 + 0x1a;
    PPU_ADDRESS = (uint8_t)(ppu_addr >> 8);
    PPU_ADDRESS = (uint8_t)(ppu_addr);

    for (i = 0; i < 4; ++i)
    {
        PPU_DATA = ATTRIBUTES[i];
    }

    // reset scroll location to top-left of screen
    PPU_SCROLL = 0x00;
    PPU_SCROLL = 0x00;

    // enable NMI and rendering
    PPU_CTRL = 0x80;
    PPU_MASK = 0x1e;

    attr_offset = 4;

    // infinite loop
    while (1)
    {
        // rotate colors every 30 frames, which is about every 0.5 seconds on NTSC
        if (FrameCount == 30)
        {
            PPU_ADDRESS = (uint8_t)(ppu_addr >> 8);
            PPU_ADDRESS = (uint8_t)(ppu_addr);

            for (i = 0; i < 4; ++i)
            {
                PPU_DATA = ATTRIBUTES[i + attr_offset];
            }

            attr_offset += 4;

            if (attr_offset == 12)
            {
                attr_offset = 0;
            }

            PPU_SCROLL = 0x00;
            PPU_SCROLL = 0x00;

            FrameCount = 0;
        }
    };
};