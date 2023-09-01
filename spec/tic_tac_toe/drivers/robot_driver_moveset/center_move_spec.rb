describe TicTacToe::Drivers::RobotDriverMoveset::CenterMove do
  let :board do
    TicTacToe::Board.new
  end

  let :player_marker do
    TicTacToe::Markers::X
  end

  let :enemy_marker do
    TicTacToe::Markers::O
  end

  let :move do
    described_class.new(board, player_marker, enemy_marker)
  end

  describe '#call' do
    context 'when board\'s center cell is empty' do
      it 'verify and returns the center cell' do
        expect(move.call).to eq(described_class::TARGET)
      end
    end

    context 'when board\'s center cell is not empty' do
      before do
        board.mark_cell!(described_class::TARGET, enemy_marker)
      end

      it 'verify and returns nil' do
        expect(move.call).to be_nil
      end
    end
  end
end
