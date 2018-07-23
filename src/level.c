#include <stdint.h>
#include <stddef.h>

// variables defined in C
#include "types.h"
#include "externals.h"

// variables defined in assembly
#include "reset.h"

void InitLevel()
{
    // disable PPU so we can write to PPU memory without flicker
    DisablePPU();

    state = STATE_LEVEL;
    pattern_table = 1;

    // write palettes
    ppu_addr = PPU_PALETTE;
    ppu_data = PAL_LEVEL;
    ppu_data_size = sizeof(PAL_LEVEL);
    WritePPU();

    // draw background
    //bg = BG_CREDITS;
    DrawBackground();

    //FamiToneMusicPlay(SONG_LEVEL);

    // re-enable PPU at next VBlank
    WaitVBlank();
    EnablePPU();
}
