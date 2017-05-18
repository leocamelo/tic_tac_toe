module TicTacToe
  module ComputerMoves
    class BestMove
      def initialize(player)
        @player = player
        @board = @player.board
      end

      def call
        if @board[4].empty?
          4
        else
          best_move = nil
          @board.available_cells.each do |cell|
            if test_marker_over?(cell, @player.marker)
              @board.delete_at(cell)
              break best_move = cell
            end
            if test_marker_over?(cell, @player.enemy_marker)
              @board.delete_at(cell)
              break best_move = cell
            end
            @board.delete_at(cell)
          end
          best_move
        end
      end

      private

      def test_marker_over?(cell, marker)
        @board.tap { |b| b[cell] = marker }.over?
      end
    end
  end
end
