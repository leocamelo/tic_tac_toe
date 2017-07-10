module TicTacToe
  class Board
    attr_reader :cells

    def initialize
      @cells = Array.new(9) { |n| Cell.new(n) }.freeze
    end

    def cells_grid
      <<~EOT
         #{@cells[0].value} | #{@cells[1].value} | #{@cells[2].value}
        ===+===+===
         #{@cells[3].value} | #{@cells[4].value} | #{@cells[5].value}
        ===+===+===
         #{@cells[6].value} | #{@cells[7].value} | #{@cells[8].value}
      EOT
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
  end
end
