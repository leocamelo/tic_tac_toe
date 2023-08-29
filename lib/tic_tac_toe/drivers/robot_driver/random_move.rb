module TicTacToe
  module Drivers
    class RobotDriver
      class RandomMove
        def initialize(board, _player_marker, _enemy_marker)
          @board = board
        end

        def call
          @board.empty_cells.sample
        end
      end
    end
  end
end
