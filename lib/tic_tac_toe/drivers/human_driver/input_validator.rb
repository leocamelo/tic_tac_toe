module TicTacToe
  module Drivers
    class HumanDriver
      class InputValidator
        def initialize(input, board)
          @input = input.to_i
          @board = board
        end

        def call
          @input if @board[@input] && @board[@input].empty?
        end
      end
    end
  end
end
