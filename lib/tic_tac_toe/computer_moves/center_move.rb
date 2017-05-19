module TicTacToe
  module ComputerMoves
    class CenterMove
      def initialize(env)
        @board = env.board
      end

      def call
        4 if @board[4].empty?
      end
    end
  end
end
