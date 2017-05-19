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

  let :game_loop do
    TicTacToe::GameLoop.new(board, player1, player2)
  end

  describe '#perform' do
    it 'perform a loop between players turns until the game over' do
      expect(board).to receive(:full?).exactly(7).times
      game_loop.perform
    end
  end
end
