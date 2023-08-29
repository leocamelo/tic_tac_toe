module TicTacToe
  class Game
    def initialize
      @board = Board.new
      @player1 = Player.new(Markers::O, Drivers::HumanDriver.new)
      @player2 = Player.new(Markers::X, Drivers::RobotDriver.new)
    end

    def run
      Face.output("Tic-Tac-Toe! (v#{VERSION})")
      GameLoop.new(@board, @player1, @player2).perform
      Face.draw_board(@board.to_grid)
      Face.output('Game over')
    end
  end
end
