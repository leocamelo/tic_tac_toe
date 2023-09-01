describe TicTacToe::GameLoop do
  let :board do
    TicTacToe::Board.new
  end

  let :driver do
    TicTacToe::Drivers::BaseDriver.new(nil)
  end

  let :player1 do
    TicTacToe::Player.new(TicTacToe::Markers::X, driver)
  end

  let :player2 do
    TicTacToe::Player.new(TicTacToe::Markers::O, driver)
  end

  let :game_loop do
    described_class.new(board, player1, player2)
  end

  describe '#perform' do
    before do
      allow(driver).to receive(:perform) { board.empty_cells.first }
    end

    it 'perform a loop between players turns until the game over' do
      expect(board).to receive(:full?).exactly(7).times
      game_loop.perform
    end
  end
end
