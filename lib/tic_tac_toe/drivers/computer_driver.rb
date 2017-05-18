module TicTacToe
  module Drivers
    class ComputerDriver
      MOVES = [
        ComputerMoves::BestMove,
        ComputerMoves::RandomMove
      ].freeze

      def initialize(player)
        @player = player
      end

      def perform
        cell = nil
        MOVES.each do |move|
          res = move.new(@player).call
          break cell = res unless res.nil?
        end
        cell
      end
    end
  end
end
