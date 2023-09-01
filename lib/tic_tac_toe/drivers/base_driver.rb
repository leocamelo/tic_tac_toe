module TicTacToe
  module Drivers
    class BaseDriver
      def initialize(face)
        @face = face
      end

      def perform(_board, _player_marker, _enemy_marker); end
    end
  end
end
