module TicTacToe
  class Board
    include Enumerable

    def initialize
      @cells = Array.new(9) { |n| Cell.new(n) }.freeze
    end

    def cells_grid
      <<~HEREDOC
         #{@cells[0].value} | #{@cells[1].value} | #{@cells[2].value}
        ===+===+===
         #{@cells[3].value} | #{@cells[4].value} | #{@cells[5].value}
        ===+===+===
         #{@cells[6].value} | #{@cells[7].value} | #{@cells[8].value}
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
      select(&:empty?).map { |c| c.value.to_i }
    end

    def full?
      none?(&:empty?)
    end

    def row_match?
      Board::RowMatchChecker.new(self).call
    end
  end
end
