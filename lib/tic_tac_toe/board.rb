module TicTacToe
  class Board
    include Enumerable

    def initialize
      @cells = Array.new(9) { |n| Cell.new(n) }.freeze
    end

    def to_s
      <<~HEREDOC
         #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
        ===+===+===
         #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
        ===+===+===
         #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
      HEREDOC
    end

    def each(&block)
      @cells.each(&block)
    end

    def [](key)
      @cells[key]
    end

    def []=(key, value)
      @cells[key].value = value
    end

    def delete_at(key)
      @cells[key].value = key
    end

    def available_cells
      select(&:empty?).map(&:to_i)
    end

    def over?
      Board::OverChecker.new(self).call
    end

    def tie?
      Board::TieChecker.new(self).call
    end
  end
end
