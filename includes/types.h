#ifndef TYPES_H_
#define TYPES_H_

#include <stdint.h>

// Sets the video standard to be used
#define TV_NTSC 1

#include "nes.h"

#define TEXT_X 10
#define TEXT_Y 14
#define TEXT_OFFSET ((NAMETABLE_OFFSET + TEXT_Y) * NUM_COLS + TEXT_X)

typedef enum state
{
    STATE_TITLE,
    STATE_LEVEL,
    STATE_CREDITS,
    STATE_PAUSE
} state_t;

#define ATTR_SIZE 4
#define ATTR_OFFSET ((TEXT_Y / 4) * (NUM_COLS / 4) + (TEXT_X / 4))

// tile indices
#define BLANK_TILE 0x00

#define BORDER_TL 0x01
#define BORDER_TR 0x02
#define BORDER_BL 0x11
#define BORDER_BR 0x12
#define BORDER_T 0x04
#define BORDER_B 0x14
#define BORDER_L 0x03
#define BORDER_R 0x13

#define SPRITE_PLAYER 0x10

#endif // TYPES_H_
