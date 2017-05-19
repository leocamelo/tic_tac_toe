module TicTacToe
  class GameLoop
    def initialize(board, player1, player2)
      @board = board
      @players_manager = PlayersManager.new(player1, player2)
    end

    def perform
      loop do
        break if game_over?
        @players_manager.current_player.mark_board!
      end
    end

    private

    def game_over?
      @board.row_match? || @board.full?
    end
  end
end
