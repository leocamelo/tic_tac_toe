describe TicTacToe::Drivers::RobotDriver::RandomMove do
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
    context 'when board have available cells' do
      before do
        markers = [player_marker, enemy_marker].shuffle
        6.times { |n| board.mark_cell!(n + 1, markers[n % markers.size]) }
      end

      it 'verify and returns a random available cell' do
        expect(move.call).to be_between(7, 9)
      end
    end

    context 'when board haven\'t available cells' do
      before do
        markers = [player_marker, enemy_marker].shuffle
        9.times { |n| board.mark_cell!(n + 1, markers[n % markers.size]) }
      end

      it 'verify and returns nil' do
        expect(move.call).to be_nil
      end
    end
  end
end
