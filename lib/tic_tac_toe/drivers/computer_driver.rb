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
        cell_to_move = nil
        MOVES.each do |move|
          res = move.new(@env).call
          break cell_to_move = res unless res.nil?
        end
        cell_to_move
      end
    end
  end
end
