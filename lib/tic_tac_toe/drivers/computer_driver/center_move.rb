module TicTacToe
  module Drivers
    class ComputerDriver
      class CenterMove
        def initialize(env)
          @board = env.board
        end

        def call
          4 if @board.cells[4].empty?
        end
      end
    end
  end
end
