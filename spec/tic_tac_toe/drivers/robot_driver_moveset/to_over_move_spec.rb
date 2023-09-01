describe TicTacToe::Drivers::RobotDriverMoveset::ToOverMove do
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
    context 'when board have combinations to match' do
      before do
        2.times { |n| board.mark_cell!(n + 1, player_marker) }
      end

      it 'verify and returns the matched cell' do
        expect(move.call).to eq(3)
      end
    end

    context 'when board haven\'t combinations to match' do
      it 'verify and returns nil' do
        expect(move.call).to be_nil
      end
    end
  end
end
