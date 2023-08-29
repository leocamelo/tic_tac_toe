module TicTacToe
  module Drivers
    class RobotDriver
      MOVESET = [
        self::CenterMove,
        self::ToOverMove,
        self::RandomMove
      ].freeze

      def perform(board, player_marker, enemy_marker)
        MOVESET.find do |move|
          play = move.new(board, player_marker, enemy_marker).call
          break play unless play.nil?
        end
      end
    end
  end
end
