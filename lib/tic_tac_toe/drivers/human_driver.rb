module TicTacToe
  module Drivers
    class HumanDriver
      def initialize(env)
        @board = env.board
      end

      def perform
        puts "\n#{@board}\nEnter [0-8]:"

        loop do
          input = validated_input
          break input unless input.nil?
        end
      end

      private

      def validated_input
        self.class::InputValidator.new(gets(chomp: true), @board).call
      end
    end
  end
end
