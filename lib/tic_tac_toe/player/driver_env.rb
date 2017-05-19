module TicTacToe
  class Player
    class DriverEnv
      attr_reader :board, :player_marker

      def initialize(board, player_marker)
        @board = board
        @player_marker = player_marker
      end

      def enemy_marker
        case @player_marker
        when Markers::X then Markers::O
        when Markers::O then Markers::X
        end
      end
    end
  end
end
