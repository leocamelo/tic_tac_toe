module TicTacToe
  class Board
    class RowMatchChecker
      ROWS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
        [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
      ].freeze

      def initialize(board)
        @cells = board.cells
      end

      def call
        ROWS.any? do |row|
          row.map { |c| @cells[c].value }.uniq.size == 1
        end
      end
    end
  end
end
