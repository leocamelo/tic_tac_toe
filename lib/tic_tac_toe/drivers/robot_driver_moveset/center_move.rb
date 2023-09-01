module TicTacToe
  module Drivers
    module RobotDriverMoveset
      class CenterMove
        TARGET = 5

        def initialize(board, _player_marker, _enemy_marker)
          @board = board
        end

        def call
          TARGET if @board.empty_cell?(TARGET)
        end
      end
    end
  end
end
