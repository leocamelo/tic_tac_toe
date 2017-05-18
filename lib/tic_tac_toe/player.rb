module TicTacToe
  class Player
    attr_reader :board, :marker

    def initialize(board, marker, driver)
      @board = board
      @marker = marker
      @driver = driver.new(self)
    end

    def mark_board!
      @board[@driver.perform] = @marker
    end

    def enemy_marker
      case marker
      when Markers::X then Markers::O
      when Markers::O then Markers::X
      end
    end
  end
end
