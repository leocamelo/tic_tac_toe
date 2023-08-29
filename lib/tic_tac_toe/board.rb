module TicTacToe
  class Board
    HORIZONTAL_MATCH_ROWS = [[0, 1, 2], [3, 4, 5], [6, 7, 8]].freeze
    VERTICAL_MATCH_ROWS = [[0, 3, 6], [1, 4, 7], [2, 5, 8]].freeze
    CROSS_MATCH_ROWS = [[0, 4, 8], [2, 4, 6]].freeze

    MATCH_ROWS = HORIZONTAL_MATCH_ROWS + VERTICAL_MATCH_ROWS + CROSS_MATCH_ROWS

    def initialize(cells = nil)
      @cells = cells || Array.new(9) { |n| Cell.new(n + 1) }.freeze
    end

    def empty_cells
      @cells.select(&:empty?).map { |c| c.value.to_i }
    end

    def empty_cell?(key)
      @cells[key - 1].empty?
    end

    def mark_cell!(key, mark)
      @cells[key - 1].value = mark
    end

    def full?
      @cells.none?(&:empty?)
    end

    def row_match?
      MATCH_ROWS.any? { |r| r.map { |c| @cells[c].value }.uniq.size == 1 }
    end

    def clone
      self.class.new(@cells.map(&:clone))
    end

    def to_grid
      @cells.map(&:value).each_slice(3).to_a
    end
  end
end
