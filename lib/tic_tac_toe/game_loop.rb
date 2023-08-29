module TicTacToe
  class GameLoop
    def initialize(board, player1, player2)
      @board = board
      @curr_player = player1
      @next_player = player2
      @halt = false
    end

    def perform
      game_turn! until game_over?
    end

    private

    def game_turn!
      if (play = @curr_player.play(@board, @next_player.marker))
        @board.mark_cell!(play, @curr_player.marker)
      else
        @halt = true
      end
      swap_players!
    end

    def game_over?
      @board.row_match? || @board.full? || @halt
    end

    def swap_players!
      @curr_player, @next_player = @next_player, @curr_player
    end
  end
end
