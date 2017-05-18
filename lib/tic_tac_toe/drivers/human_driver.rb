module TicTacToe
  module Drivers
    class HumanDriver
      def initialize(player)
        @board = player.board
      end

      def perform
        puts @board
        puts "\nEnter [0-8]:"

        loop do
          input = gets.chomp.to_i
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
