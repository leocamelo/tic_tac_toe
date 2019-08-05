module TicTacToe
  class GameLoop
    def initialize(board, player1, player2)
      @board = board
      @turns_manager = TurnsManager.new(player1, player2)
    end

    def perform
      loop do
        break if game_over?

        current_player = @turns_manager.current_player
        current_player.perform_driver!

        break if current_player.gived_up?

        current_player.mark_board!
      end
    end

    private

    def game_over?
      @board.row_match? || @board.full?
    end
  end
end
