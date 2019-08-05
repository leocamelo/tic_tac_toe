module TicTacToe
  class Board
    attr_reader :cells

    def initialize
      @cells = Array.new(9) { |n| Cell.new(n) }.freeze
    end

    def cells_grid
      <<~TXT
         #{cells_row(0..2)}
        ===+===+===
         #{cells_row(3..5)}
        ===+===+===
         #{cells_row(6..9)}
      TXT
    end

    def empty_cell_at(key)
      @cells[key].value = key
    end

    def available_cells
      @cells.select(&:empty?).map { |c| c.value.to_i }
    end

    def full?
      @cells.none?(&:empty?)
    end

    def row_match?
      Board::RowMatchChecker.new(self).call
    end

    private

    def cells_row(range)
      @cells[range].map(&:value).join(' | ')
    end
  end
end
