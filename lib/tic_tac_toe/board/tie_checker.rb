module TicTacToe
  class Board
    class TieChecker
      def initialize(board)
        @board = board
      end

      def call
        @board.none?(&:empty?)
      end
    end
  end
end
