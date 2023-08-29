describe TicTacToe::GameLoop do
  let :board do
    TicTacToe::Board.new
  end

  let :player1 do
    TicTacToe::Player.new(TicTacToe::Markers::X, double_driver)
  end

  let :player2 do
    TicTacToe::Player.new(TicTacToe::Markers::O, double_driver)
  end

  let :game_loop do
    described_class.new(board, player1, player2)
  end

  describe '#perform' do
    it 'perform a loop between players turns until the game over' do
      expect(board).to receive(:full?).exactly(7).times
      game_loop.perform
    end
  end
end
