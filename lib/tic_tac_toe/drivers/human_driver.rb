module TicTacToe
  module Drivers
    class HumanDriver
      def initialize(env)
        @board = env.board
      end

      def perform
        InOut.output("\n#{@board.cells_grid}")

        loop do
          InOut.output("\nEnter [0-8] to mark or 'q' to quit:")
          input = validated_input
          break input unless input.nil?
        end
      end

      private

      def validated_input
        self.class::InputValidator.new(InOut.input, @board).call
      end
    end
  end
end
