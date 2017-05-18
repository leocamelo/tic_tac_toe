module TicTacToe
  class Game
    def initialize
      @board = Board.new
      @player1 = Player.new(@board, Markers::O, Drivers::HumanDriver)
      @player2 = Player.new(@board, Markers::X, Drivers::ComputerDriver)
    end

    def run
      puts "Tic-Tac-Toe!\n\n"
      looper.perform
      puts @board
      puts "\nGame over"
    end

    private

    def looper
      Looper.new(@board, PlayersManager.new(@player1, @player2))
    end
  end
end
