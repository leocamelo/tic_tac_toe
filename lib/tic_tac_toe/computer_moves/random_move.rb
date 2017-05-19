module TicTacToe
  module ComputerMoves
    class RandomMove
      def initialize(player)
        @board = player.board
      end

      def call
        @board.available_cells.sample
      end
    end
  end
end
