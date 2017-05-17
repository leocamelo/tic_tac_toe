module TicTacToe
  class Cell
    class EmptyChecker
      def initialize(cell)
        @cell = cell
      end

      def call
        ![Markers::X, Markers::O].include?(@cell.to_s)
      end
    end
  end
end
