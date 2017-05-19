module TicTacToe
  module ComputerMoves
    class RandomMove
      def initialize(env)
        @board = env.board
      end

      def call
        @board.available_cells.sample
      end
    end
  end
end
