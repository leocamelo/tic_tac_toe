describe TicTacToe::Drivers::HumanDriver do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  let :human_driver do
    TicTacToe::Drivers::HumanDriver.new(player)
  end

  before do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('4')
  end

  describe '#perform' do
    before do
      allow(STDOUT).to receive(:puts)
    end

    it 'prints the board' do
      expect { human_driver.perform }.to output(/#{board}/).to_stdout
    end

    it 'prints instructions' do
      expect { human_driver.perform }.to output(/Enter \[0-8\]/).to_stdout
    end

    it 'returns the referred cell in integer format' do
      expect(human_driver.perform).to eq(4)
    end
  end
end
