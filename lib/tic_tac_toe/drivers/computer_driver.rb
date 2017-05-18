module TicTacToe
  module Drivers
    class ComputerDriver
      MOVES = [
        ComputerMoves::CenterMove,
        ComputerMoves::ToOverMove,
        ComputerMoves::RandomMove
      ].freeze

      def initialize(player)
        @player = player
      end

      def perform
        cell_to_move = nil
        MOVES.each do |move|
          res = move.new(@player).call
          break cell_to_move = res unless res.nil?
        end
        cell_to_move
      end
    end
  end
end
