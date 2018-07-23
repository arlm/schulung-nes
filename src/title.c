#include <stdint.h>
#include <stddef.h>

// variables defined in C
#include "types.h"
#include "externals.h"

// variables defined in assembly
#include "reset.h"

void DrawBackground_Top()
{
    if (pattern_table == 0)
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_0 + NAMETABLE_OFFSET) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_0 + NAMETABLE_OFFSET);
    }
    else
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_1 + NAMETABLE_OFFSET) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_1 + NAMETABLE_OFFSET);
    }

    // draw top
    PPU_DATA = BORDER_TL;

    for (i = 0; i < (NUM_COLS - 2); ++i)
    {
        PPU_DATA = BORDER_T;
    }

    PPU_DATA = BORDER_TR;
}

void DrawBackground_Middle()
{
    if (pattern_table == 0)
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_0 + NAMETABLE_OFFSET + NUM_COLS * drawing_line) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_0 + NAMETABLE_OFFSET + NUM_COLS * drawing_line);
    }
    else
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_1 + NAMETABLE_OFFSET + NUM_COLS * drawing_line) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_1 + NAMETABLE_OFFSET + NUM_COLS * drawing_line);
    }

    PPU_DATA = BORDER_L;

    for (i = 0; i < (NUM_COLS - 2); ++i)
    {
        PPU_DATA = BLANK_TILE;
    }

    PPU_DATA = BORDER_R;
}

void DrawBackground_Bottom()
{
    if (pattern_table == 0)
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_0 + NAMETABLE_OFFSET + NUM_COLS * (NUM_ROWS - 1)) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_0 + NAMETABLE_OFFSET + NUM_COLS * (NUM_ROWS - 1));
    }
    else
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_1 + NAMETABLE_OFFSET + NUM_COLS * (NUM_ROWS - 1)) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_1 + NAMETABLE_OFFSET + NUM_COLS * (NUM_ROWS - 1));
    }

    // draw bottom
    PPU_DATA = BORDER_BL;

    for (i = 0; i < (NUM_COLS - 2); ++i)
    {
        PPU_DATA = BORDER_B;
    }

    PPU_DATA = BORDER_BR;
}

void ClearText()
{
    if (pattern_table == 0)
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_0 + TEXT_OFFSET) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_0 + TEXT_OFFSET);
    }
    else
    {
        PPU_ADDRESS = (uint8_t)((PPU_NAMETABLE_1 + TEXT_OFFSET) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_NAMETABLE_1 + TEXT_OFFSET);
    }

    for (i = 0; i < (length_of_TEXT); ++i)
    {
        PPU_DATA = BLANK_TILE;
    }

    if (pattern_table == 0)
    {
        PPU_ADDRESS = (uint8_t)((PPU_ATTRIB_TABLE_0 + ATTR_OFFSET) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_ATTRIB_TABLE_0 + ATTR_OFFSET);
    }
    else
    {
        PPU_ADDRESS = (uint8_t)((PPU_ATTRIB_TABLE_1 + ATTR_OFFSET) >> 8);
        PPU_ADDRESS = (uint8_t)(PPU_ATTRIB_TABLE_1 + ATTR_OFFSET);
    }

    for (i = 0; i < ATTR_SIZE; ++i)
    {
        PPU_DATA = BLANK_TILE;
    }
}
