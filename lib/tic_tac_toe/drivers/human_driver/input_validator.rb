module TicTacToe
  module Drivers
    class HumanDriver
      class InputValidator
        def initialize(input, board)
          @input = input
          @cells = board.cells
        end

        def call
          input = @input.downcase
          return :quit if input == 'q'

          if input_number?(input)
            input = @input.to_i
            input if input_on_board?(input)
          end
        end

        private

        def input_number?(input)
          true if Integer(input) rescue false
        end

        def input_on_board?(input)
          @cells[input] && @cells[input].empty?
        end
      end
    end
  end
end
