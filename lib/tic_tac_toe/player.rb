module TicTacToe
  class Player
    attr_reader :marker

    def initialize(marker, driver)
      @marker = marker
      @driver = driver
    end

    def play(board, enemy_marker)
      @driver.perform(board.clone, @marker, enemy_marker)
    end
  end
end
