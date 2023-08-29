module TicTacToe
  module Drivers
    class RobotDriver
      class ToOverMove
        def initialize(board, player_marker, enemy_marker)
          @board = board
          @player_marker = player_marker
          @enemy_marker = enemy_marker
        end

        def call
          @board.empty_cells.find do |cell|
            test_match(cell, @player_marker) || test_match(cell, @enemy_marker)
          end
        end

        private

        def test_match(cell, marker)
          cell if @board.clone.tap { |b| b.mark_cell!(cell, marker) }.row_match?
        end
      end
    end
  end
end
