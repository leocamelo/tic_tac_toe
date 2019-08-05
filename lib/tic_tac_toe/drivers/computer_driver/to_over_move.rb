module TicTacToe
  module Drivers
    class ComputerDriver
      class ToOverMove
        def initialize(env)
          @board = env.board
          @player_marker = env.player_marker
          @enemy_marker = env.enemy_marker
        end

        def call
          @board.available_cells.find do |cell|
            test_match(cell, @player_marker) || test_match(cell, @enemy_marker)
          end
        end

        private

        def test_match(cell, marker)
          cell if @board.tap { |b| b.cells[cell].value = marker }.row_match?
        ensure
          @board.empty_cell_at(cell)
        end
      end
    end
  end
end
