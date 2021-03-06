require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  win_index_1 = ""
  win_index_2 = ""
  win_index_3 = ""
  pos_1 = ""
  pos_2 = ""
  pos_3 = ""
  win_combo_f = []
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]
    # binding.pry
    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win_combo_f = win_combo
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win_combo_f = win_combo
    else
      win_combo_f = false
    end
  end
  win_combo_f
end

def full?(board)
  if board.include?(" ") || board.include?("") || board.include?(nil)
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif WIN_COMBINATIONS.include? (won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    temp_a = won?(board)
    if board[temp_a[0]] == "X" &&   board[temp_a[1]] == "X" && board[temp_a[2]] == "X"
      return "X"
    elsif board[temp_a[0]] == "O" && board[temp_a[1]] == "O" && board[temp_a[2]] == "O"
      return "O"
    end
  end
end
