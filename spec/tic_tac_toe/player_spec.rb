describe TicTacToe::Player do
  let :board do
    TicTacToe::Board.new
  end

  let :driver do
    TicTacToe::Drivers::BaseDriver.new(nil)
  end

  let :player do
    described_class.new(TicTacToe::Markers::X, driver)
  end

  describe '#play' do
    before do
      allow(driver).to receive(:perform).and_return(1)
    end

    it 'performs driver' do
      expect(player.play(board, TicTacToe::Markers::O)).to eq(1)
    end
  end
end
