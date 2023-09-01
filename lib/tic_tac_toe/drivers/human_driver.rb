module TicTacToe
  module Drivers
    class HumanDriver < BaseDriver
      QUIT_SIGNAL = 'q'.freeze

      def perform(board, _player_marker, _enemy_marker)
        @face.draw_board(board.to_grid)

        loop do
          @face.output('Enter [0-8] to mark or "q" to quit:')

          raw_input = @face.input
          break if raw_input.downcase == QUIT_SIGNAL

          input = parse_input(raw_input)
          break input if input && input_available?(board, input)
        end
      end

      private

      def parse_input(raw_input)
        Integer(raw_input)
      rescue ArgumentError
        nil
      end

      def input_available?(board, input)
        board.empty_cells.include?(input)
      end
    end
  end
end
