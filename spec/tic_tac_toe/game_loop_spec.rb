describe TicTacToe::GameLoop do
  let :board do
    TicTacToe::Board.new
  end

  let :player1 do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  let :player2 do
    TicTacToe::Player.new(board, TicTacToe::Markers::O, driver_double)
  end

  let :players_manager do
    TicTacToe::PlayersManager.new(player1, player2)
  end

  let :game_loop do
    TicTacToe::GameLoop.new(board, players_manager)
  end

  describe '#perform' do
    it 'perform a loop between players turns until the game over' do
      expect(board).to receive(:tie?).exactly(7).times
      game_loop.perform
    end
  end
end
