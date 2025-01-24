class Board < ApplicationRecord
  validates :name, :email, :width, :height, :mines, presence: true
  validates :width, :height, :mines, numericality: { greater_than: 0 }

  def generate_board
    board = Array.new(height) { Array.new(width, 0) }

    mines.times do
      loop do
        row, col = rand(height), rand(width)
        next if board[row][col] == '💣'

        board[row][col] = '💣'
        break
      end
    end

    self.data = board
  end
end
