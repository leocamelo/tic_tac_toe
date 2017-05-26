module TicTacToe
  class Cell
    attr_reader :value

    def initialize(value)
      self.value = value
    end

    def to_i
      @value.to_i
    end

    def value=(value)
      @value = value.to_s
    end

    def empty?
      Cell::EmptyChecker.new(self).call
    end
  end
end
