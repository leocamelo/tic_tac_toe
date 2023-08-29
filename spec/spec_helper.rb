require 'rspec'
require './lib/tic_tac_toe'

module SpecHelper
  class DoubleDriver
    def perform(board, _player_marker, _enemy_marker)
      board.empty_cells.first
    end
  end

  def double_driver
    DoubleDriver.new
  end
end

RSpec.configure do |config|
  config.include(SpecHelper)
end
