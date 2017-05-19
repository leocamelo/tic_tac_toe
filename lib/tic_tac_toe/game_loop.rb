module TicTacToe
  class GameLoop
    def initialize(board, players_manager)
      @board = board
      @players_manager = players_manager
    end

    def perform
      loop do
        break if @board.over? || @board.tie?
        @players_manager.current_player.mark_board!
      end
    end
  end
end
