module TicTacToe
  class Cell
    def initialize(value)
      self.value = value
    end

    def to_s
      @value
    end

    def to_i
      @value.to_i
    end

    def empty?
      @value != Markers::X && @value != Markers::O
    end

    def value=(value)
      @value = value.to_s
    end
  end
end
