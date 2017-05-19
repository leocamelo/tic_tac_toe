module TicTacToe
  class TurnsManager
    def initialize(player1, player2)
      @player1 = @current_player = player1
      @player2 = player2
    end

    def current_player
      current_player = @current_player
      @current_player = next_player
      current_player
    end

    private

    def next_player
      case @current_player
      when @player1 then @player2
      when @player2 then @player1
      end
    end
  end
end
