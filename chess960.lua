local chess960 = {}

local n5n = {
  {1,2},
  {1,3},
  {1,4},
  {1,5},
  {2,3},
  {2,4},
  {2,5},
  {3,4},
  {3,5},
  {4,5}
}

local function nth_nil(board, n)
  for i = 1, 8 do
    if board[i] == nil then
      n = n - 1
    end

    if n <= 0 then
      return i
    end
  end
end

function chess960.start_position(n)
  local board = {nil, nil, nil, nil, nil, nil, nil, nil}
  local board_str = ''

  local n2 = n >> 2
  local b1 = n % 4
  local n3 = n2 >> 2
  local b2 = n2 % 4
  local n4 = n3 // 6
  local q = n3 % 6
  local ns = n5n[n4 + 1]

  board[b1 * 2 + 2] = 'B'
  board[b2 * 2 + 1] = 'B'
  board[nth_nil(board, q + 1)] = 'Q'
  board[nth_nil(board, ns[1])] = 'N'
  board[nth_nil(board, ns[2 - 1])] = 'N'

  board[nth_nil(board, 1)] = 'R'
  board[nth_nil(board, 1)] = 'K'
  board[nth_nil(board, 1)] = 'R'

  for i = 1, 8 do
    board_str = board_str .. (board[i] or ' ')
  end

  return board_str
end

function chess960.random_start_position()
  return chess960.start_position(math.random(960) - 1)
end

return chess960
