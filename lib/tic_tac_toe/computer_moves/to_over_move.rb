module TicTacToe
  module ComputerMoves
    class ToOverMove
      def initialize(player)
        @board = player.board
        @player_marker = player.marker
        @enemy_marker = player.enemy_marker
      end

      def call
        cell_to_move = nil
        @board.available_cells.each do |cell|
          break cell_to_move = cell if test_over(cell, @player_marker)
          break cell_to_move = cell if test_over(cell, @enemy_marker)
          @board.delete_at(cell)
        end
        cell_to_move
      end

      private

      def test_over(cell, marker)
        over = @board.tap { |b| b[cell] = marker }.over?
        @board.delete_at(cell)
        over
      end
    end
  end
end
