describe TicTacToe::Drivers::HumanDriver do
  let :board do
    TicTacToe::Board.new
  end

  let :driver_env do
    TicTacToe::Player::DriverEnv.new(board, TicTacToe::Markers::X)
  end

  let :human_driver do
    described_class.new(driver_env)
  end

  let :io do
    TicTacToe::InOut
  end

  describe '#perform' do
    before do
      allow(io).to receive(:output)
      allow(io).to receive(:input).and_return('4')
    end

    it 'prints the board and instructions' do
      expect(io).to receive(:output).ordered.with(/#{board.cells_grid}/)
      expect(io).to receive(:output).ordered.with(/Enter \[0-8\]/)
      human_driver.perform
    end

    it 'returns the referred cell in integer format' do
      expect(human_driver.perform).to eq(4)
    end
  end
end
