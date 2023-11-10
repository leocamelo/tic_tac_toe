module TicTacToe
  module Drivers
    class BaseDriver
      def initialize(face)
        @face = face
      end

      def perform(board, _player_marker, _enemy_marker)
        board.empty_cells.first
      end
    end
  end
end
