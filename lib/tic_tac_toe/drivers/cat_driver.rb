module TicTacToe
  module Drivers
    class CatDriver < BaseDriver
      def perform(_board, _player_marker, _enemy_marker)
        @face.output('meow')
        nil
      end
    end
  end
end
