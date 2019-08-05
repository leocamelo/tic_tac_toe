module TicTacToe
  class Player
    def initialize(board, marker, driver)
      @board = board
      @marker = marker
      @driver = driver.new(driver_env)

      @next_play = nil
      @gived_up = false
    end

    def perform_driver!
      play = @driver.perform

      if play == :quit
        @gived_up = true
        @next_play = nil
      else
        @next_play = play
      end
    end

    def mark_board!
      return if @next_play.nil?

      @board.cells[@next_play].value = @marker
      @next_play = nil
    end

    def gived_up?
      @gived_up
    end

    private

    def driver_env
      Player::DriverEnv.new(@board, @marker)
    end
  end
end
