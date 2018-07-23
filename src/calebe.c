#include <stdint.h>
#include <stddef.h>

// Sets the video standard to be used
#define TV_NTSC 1

// variables defined in C
#include "types.h"
#include "externals.h"
#include "data.h"
#include "calebe.h"

#pragma bss-name(push, "ZEROPAGE")
uint8_t i;           // loop counter
uint8_t attr_offset; // offset into ATTRIBUTES

// used by WritePPU method
uintptr_t ppu_addr;      // destination PPU address
uint8_t const *ppu_data; // pointer to data to copy to PPU
uint8_t ppu_data_size;   // # of bytes to copy to PPU

uint8_t title_screen;
uint8_t drawing_line;
#pragma bss-name(pop)

#pragma bss-name(push, "OAM")
sprite_t player;
#pragma bss-name(pop)
// variables defined in assembly
#include "reset.h"

// reset scroll location to top-left of screen
void ResetScroll()
{
    PPU_SCROLL = 0x00;
    PPU_SCROLL = 0x00;
}

// enable NMI and rendering
void EnablePPU_NameTable_0()
{
    PPU_CTRL = PPUCTRL_NAMETABLE_0 | // use nametable 0
               PPUCTRL_INC_1_HORIZ | // PPU_DATA increments 1 horizontally
               PPUCTRL_SPATTERN_0 |  // background uses pattern table 0
               PPUCTRL_BPATTERN_0 |  // sprites uses pattern table 0
               PPUCTRL_SSIZE_16x16 | // sprite size of 8x8
               PPUCTRL_NMI_ON;       // enable NMIs

    PPU_MASK = PPUMASK_COLOR |    // show colors
               PPUMASK_L8_BSHOW | // show background tiles in leftmost 8px
               PPUMASK_L8_SSHOW | // show sprites in leftmost 8px
               PPUMASK_BSHOW |    // show background
               PPUMASK_SSHOW;     // show background tiles in leftmost 8px
}

void DisablePPU()
{
    PPU_CTRL = 0x00;
    PPU_MASK = 0x00;
}

void WritePPU()
{
    PPU_ADDRESS = (uint8_t)(ppu_addr >> 8);
    PPU_ADDRESS = (uint8_t)(ppu_addr);

    for (i = 0; i < ppu_data_size; ++i)
    {
        PPU_DATA = ppu_data[i];
    }
}

void DrawBackground()
{
    PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_0 >> 8);
    PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_0);
}

void HandleInput()
{
    switch (state)
    {
    case STATE_TITLE:
        if ((InputPort1 & BUTTON_START) &&
            !(InputPort1Prev & BUTTON_START))
        {
            InitLevel();
            //FamiToneSfxPlay(SFX_START);
        }
        break;
    case STATE_LEVEL:
        if ((InputPort1 & BUTTON_START) &&
            !(InputPort1Prev & BUTTON_START))
        {
            InitCredits();
        }
        break;
    case STATE_CREDITS:
    default:
        break;
    }
}

/**
 * main() will be called at the end of the initialization code in reset.s.
 * Unlike C programs on a computer, it takes no arguments and returns no value.
 */
void main(void)
{
    // load the palette data into PPU memory $3f00-$3f1f
    ppu_addr = PPU_PALETTE;
    ppu_data = PALETTES;
    ppu_data_size = length_of_PALETTES;
    WritePPU();

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
    ppu_addr = PPU_NAMETABLE_0 + TEXT_OFFSET;
    ppu_data = (uint8_t const *)TEXT;
    ppu_data_size = length_of_TEXT;
    WritePPU();

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
    ppu_addr = PPU_ATTRIB_TABLE_0 + ATTR_OFFSET;
    ppu_data = ATTRIBUTES;
    ppu_data_size = ATTR_SIZE;
    WritePPU();

    // turn on rendering
    ResetScroll();
    EnablePPU_NameTable_0();

    attr_offset = ATTR_SIZE;
    title_screen = 0;
    drawing_line = 0;

    // infinite loop
    while (1)
    {
        WaitFrame();

        // rotate colors every half second
        if (title_screen == 0)
        {
            if (InputPort1 & BUTTON_ANY_ACTION)
            {
                ClearText();

                title_screen = 1;

                continue;
            }

            if (FrameCount == (FRAMES_PER_SEC / 2))
            {
                // write attributes
                ppu_data = ATTRIBUTES + attr_offset;
                WritePPU();

                // rotate attributes
                attr_offset += ATTR_SIZE;

                if (attr_offset == length_of_ATTRIBUTES)
                {
                    attr_offset = 0;
                }

                FrameCount = 0;
                ResetScroll();
            }
        }
        else
        {
            if (drawing_line == 0)
            {
                DrawBackground_Top();
                ++drawing_line;
                continue;
            }
            else if (drawing_line < NUM_ROWS - 1)
            {
                DrawBackground_Middle();
                ++drawing_line;
                continue;
            }
            else if (drawing_line == NUM_ROWS - 1)
            {
                DrawBackground_Bottom();
                ++drawing_line;

                player.x = (MAX_X / 2) - (SPRITE_WIDTH / 2);
                player.y = (MAX_Y / 2) - (SPRITE_HEIGHT / 2) - SPRITE_HEIGHT * 2;
                player.tile_index = SPRITE_PLAYER;

                continue;
            }

            ResetScroll();

            if (InputPort1 & BUTTON_UP)
            {
                if (player.y > MIN_Y + SPRITE_HEIGHT)
                {
                    --player.y;
                }
            }

            if (InputPort1 & BUTTON_DOWN)
            {
                if (player.y < MAX_Y - (2 * SPRITE_HEIGHT))
                {
                    ++player.y;
                }
            }

            if (InputPort1 & BUTTON_LEFT)
            {
                if (player.x > MIN_X + SPRITE_WIDTH)
                {
                    --player.x;
                }
            }

            if (InputPort1 & BUTTON_RIGHT)
            {
                if (player.x < MAX_X - (2 * SPRITE_WIDTH))
                {
                    ++player.x;
                }
            }
        }
    };
};
