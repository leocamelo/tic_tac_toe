module TicTacToe
  class Game
    def initialize
      @board = Board.new
      @player1 = Player.new(@board, Markers::O, Drivers::HumanDriver)
      @player2 = Player.new(@board, Markers::X, Drivers::ComputerDriver)
    end

    def run
      puts "Tic-Tac-Toe!\n"
      game_loop.perform
      puts "#{@board}\nGame over"
    end

    private

    def game_loop
      GameLoop.new(@board, PlayersManager.new(@player1, @player2))
    end
  end
end
