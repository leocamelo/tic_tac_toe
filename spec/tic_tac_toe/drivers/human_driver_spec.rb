describe TicTacToe::Drivers::HumanDriver do
  let :board do
    TicTacToe::Board.new
  end

  let :player_marker do
    TicTacToe::Markers::X
  end

  let :enemy_marker do
    TicTacToe::Markers::O
  end

  let :driver do
    described_class.new
  end

  let :face do
    TicTacToe::Face
  end

  describe '#perform' do
    before do
      allow(face).to receive(:output)
      allow(face).to receive(:input).and_return('5')
    end

    it 'prints the board and instructions' do
      expect(face).to receive(:draw_board).ordered.with(board.to_grid)
      expect(face).to receive(:output).ordered.with(/Enter \[0-8\]/)
      driver.perform(board, player_marker, enemy_marker)
    end

    it 'returns the referred cell in integer format' do
      expect(driver.perform(board, player_marker, enemy_marker)).to eq(5)
    end
  end
end
