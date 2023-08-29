describe TicTacToe::Player do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    described_class.new(TicTacToe::Markers::X, double_driver)
  end

  describe '#play' do
    it 'performs driver' do
      expect(player.play(board, TicTacToe::Markers::O)).to eq(1)
    end
  end
end
