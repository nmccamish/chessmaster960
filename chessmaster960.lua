-- luacheck: globals event mainmemory
local chess960 = require('chess960')

local BOARD_BLACK_START_ADDR = 0x100
local BOARD_WHITE_START_ADDR = 0x170
local OPENING_BOOK_SETTING = 0x070C
local PIECES = {
  ['P'] = 0,
  ['K'] = 1,
  ['R'] = 3,
  ['N'] = 2,
  ['B'] = 4,
  ['Q'] = 5,
}

local function set_board(board)
  for i = 1, 8 do
    local piece = PIECES[string.sub(board, i, i)]

    mainmemory.write_u8(BOARD_BLACK_START_ADDR + i - 1, piece | 0x20)
    mainmemory.write_u8(BOARD_WHITE_START_ADDR + i - 1, piece | 0x10)
  end
end

event.on_bus_exec(function()
    local board = chess960.random_start_position()

    set_board(board)
end, 0xC279)

-- appears to be useless setting, but turn it off anyways
mainmemory.write_u8(OPENING_BOOK_SETTING, 0x00)
math.randomseed(os.time())
