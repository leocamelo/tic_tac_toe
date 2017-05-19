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
          cell_to_move = nil
          @board.available_cells.each do |cell|
            break cell_to_move = cell if test_row_match(cell, @player_marker)
            break cell_to_move = cell if test_row_match(cell, @enemy_marker)
          end
          cell_to_move
        end

        private

        def test_row_match(cell, marker)
          row_match = @board.tap { |b| b[cell] = marker }.row_match?
          @board.delete_at(cell)
          row_match
        end
      end
    end
  end
end
