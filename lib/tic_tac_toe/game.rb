module TicTacToe
  class Game
    def initialize
      @board = Board.new
      @player1 = Player.new(@board, Markers::O, Drivers::HumanDriver)
      @player2 = Player.new(@board, Markers::X, Drivers::ComputerDriver)
    end

    def run
      puts "Tic-Tac-Toe! (v#{VERSION})\n"
      GameLoop.new(@board, @player1, @player2).perform
      puts "\n#{@board.cells_grid}\nGame over"
    end
  end
end
