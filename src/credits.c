#include <stdint.h>
#include <stddef.h>

// variables defined in C
#include "types.h"
#include "externals.h"

// variables defined in assembly
#include "reset.h"

void InitCredits()
{
    DisablePPU();
    /*
    // hide sprites
    for (i = 0; i < 16; i++)
    {
        player_sprites[i].y = SPRITE_OFFSCREEN_Y;
    }
    for (i = 0; i < 4; i++)
    {
        ring_sprites[i].y = SPRITE_OFFSCREEN_Y;
    }

    state = STATE_CREDITS;
    pattern_table = 1;
    credits_msg = 0;

    // write palettes
    ppu_addr = PPU_PALETTE;
    ppu_data = PAL_CREDITS;
    ppu_data_size = sizeof(PAL_CREDITS);
    WritePPU();

    // draw background
    bg = BG_CREDITS;
    DrawBackground();

    InitCreditsSprites();
*/
    FrameCount = 0;

    WaitVBlank();
    EnablePPU();
}

void InitFade()
{
    //state = STATE_FADE;
    //FamiToneMusicPlay(SONG_CREDITS);

    FrameCount = 0;
    fade_count = 0;

    // copy level palette
    for (i = 0; i < sizeof(PAL_LEVEL); ++i)
    {
        fade_palette[i] = PAL_LEVEL[i];
    }
}

void UpdateFade()
{
    // take a step every half second
    if (FrameCount >= FRAMES_PER_SEC / 2)
    {
        FrameCount = 0;
        ++fade_count;

        // after the first two seconds, fade
        if (fade_count >= 4)
        {
            ResetScroll();
            FadeStep();
        }

        // after five seconds, roll credits
        if (fade_count == 10)
        {
            InitCredits();
        }
    }
}

void FadeStep()
{
    for (i = 0; i < sizeof(PAL_LEVEL); ++i)
    {
        if (fade_palette[i] <= 0x10)
        {
            fade_palette[i] = COLOR_BLACK;
        }
        else if (fade_palette[i] != COLOR_BLACK)
        {
            fade_palette[i] -= 0x10;
        }
    }

    DisablePPU();

    ppu_addr = PPU_PALETTE;
    ppu_data = fade_palette;
    ppu_data_size = sizeof(PAL_LEVEL);
    WritePPU();

    WaitVBlank();
    EnablePPU();
}
