module TicTacToe
  class Player
    attr_reader :board, :marker

    def initialize(board, marker, driver)
      @board = board
      @marker = marker
      @driver = driver.new(self)
    end

    def mark
      @board[@driver.perform] = @marker
    end
  end
end
