#include <stdint.h>
#include <stddef.h>

// variables defined in C
#include "types.h"
#include "externals.h"

// variables defined in assembly
#include "reset.h"

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
