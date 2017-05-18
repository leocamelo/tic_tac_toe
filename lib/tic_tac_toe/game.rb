module TicTacToe
  class Game
    def initialize
      @board = Board.new
    end

    def run
      puts 'Tic-Tac-Toe!'
      puts @board
      puts 'Enter [0-8]:'

      player1 = Player.new(@board, Markers::O, Drivers::HumanDriver)
      player2 = Player.new(@board, Markers::X, Drivers::ComputerDriver)

      until @board.over? || @board.tie?
        player1.mark
        player2.mark if !@board.over? && !@board.tie?
        puts @board
      end

      puts 'Game over'
    end
  end
end
