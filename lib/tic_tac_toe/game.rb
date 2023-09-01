module TicTacToe
  class Game
    PLAYER1_MARKER = Markers::O
    PLAYER2_MARKER = Markers::X

    def initialize(face, player1_driver, player2_driver)
      @face = face.new
      @board = Board.new
      @player1 = Player.new(PLAYER1_MARKER, player1_driver.new(@face))
      @player2 = Player.new(PLAYER2_MARKER, player2_driver.new(@face))
    end

    def run
      @face.output("Tic-Tac-Toe! (v#{VERSION})")
      GameLoop.new(@board, @player1, @player2).perform
      @face.draw_board(@board.to_grid)
      @face.output('Game over')
    end
  end
end
