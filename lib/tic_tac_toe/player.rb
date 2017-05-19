module TicTacToe
  class Player
    def initialize(board, marker, driver)
      @board = board
      @marker = marker
      @driver = driver.new(driver_env)
    end

    def mark_board!
      @board[@driver.perform] = @marker
    end

    private

    def driver_env
      DriverEnv.new(@board, @marker)
    end
  end
end
