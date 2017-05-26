module TicTacToe
  class Cell
    class EmptyChecker
      def initialize(cell)
        @cell = cell
      end

      def call
        ![Markers::X, Markers::O].include?(@cell.value)
      end
    end
  end
end
