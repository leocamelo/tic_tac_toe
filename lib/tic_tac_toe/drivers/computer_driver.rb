module TicTacToe
  module Drivers
    class ComputerDriver
      MOVES = [
        self::CenterMove,
        self::ToOverMove,
        self::RandomMove
      ].freeze

      def initialize(env)
        @env = env
      end

      def perform
        MOVES.find do |move|
          cell = move.new(@env).call
          break cell unless cell.nil?
        end
      end
    end
  end
end
