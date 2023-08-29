module TicTacToe
  class Face
    def self.input
      gets.chomp
    end

    def self.output(str)
      puts("\n#{str}")
    end

    def self.draw_board(board)
      rows = board.map { |r| r.map { |c| " #{c} " }.join('|') }
      output(rows.join("\n---+---+---\n"))
    end
  end
end
