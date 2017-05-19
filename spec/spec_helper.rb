require 'rspec'
require './lib/tic_tac_toe'

module SpecHelper
  def driver_double
    Struct.new(:env) do
      def perform
        env.board.available_cells.first
      end
    end
  end

  def fill_board(board, cells, marker)
    cells.times { |n| board[n] = marker }
  end
end

RSpec.configure do |config|
  config.include(SpecHelper)
end
