module TicTacToe
  class GameLoop
    def initialize(board, player1, player2)
      @board = board
      @turns_manager = TurnsManager.new(player1, player2)
    end

    def perform
      game_turn! until game_over? || player_gived_up?
    end

    private

    def game_turn!
      current_player = @turns_manager.current_player
      current_player.perform_driver!

      if current_player.gived_up?
        @player_gived_up = true
      else
        current_player.mark_board!
      end
    end

    def game_over?
      @board.row_match? || @board.full?
    end

    def player_gived_up?
      !@player_gived_up.nil?
    end
  end
end
