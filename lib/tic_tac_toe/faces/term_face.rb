module TicTacToe
  module Faces
    class TermFace
      def input
        gets.chomp
      end

      def output(str)
        puts("\n#{str}")
      end

      def draw_board(board)
        rows = board.map { |r| r.map { |c| " #{c} " }.join('|') }
        output(rows.join("\n---+---+---\n"))
      end
    end
  end
end
