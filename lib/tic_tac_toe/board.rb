module TicTacToe
  class Board
    COMBINATION_ROWS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ].freeze

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

    def over?
      COMBINATION_ROWS.any? do |row|
        row.map { |c| self[c].to_s }.uniq.size == 1
      end
    end

    def tie?
      none?(&:empty?)
    end
  end
end
