module TicTacToe
  module ComputerMoves
    class RandomMove
      def initialize(player)
        @available_cells = player.board.available_cells
      end

      def call
        @available_cells[rand(0..@available_cells.count)]
      end
    end
  end
end
