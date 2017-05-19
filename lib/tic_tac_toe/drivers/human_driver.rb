module TicTacToe
  module Drivers
    class HumanDriver
      def initialize(env)
        @board = env.board
      end

      def perform
        puts "\n#{@board}\nEnter [0-8]:"

        loop do
          input = gets(chomp: true).to_i
          break input if input_valid?(input)
        end
      end

      private

      def input_valid?(input)
        @board[input] && @board[input].empty?
      end
    end
  end
end
