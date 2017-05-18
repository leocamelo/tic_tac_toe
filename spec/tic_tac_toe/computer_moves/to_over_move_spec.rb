describe TicTacToe::ComputerMoves::ToOverMove do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  let :to_over_move do
    TicTacToe::ComputerMoves::ToOverMove.new(player)
  end

  describe '#call' do
    context 'when board have combinations to match' do
      before do
        2.times { |n| board[n] = TicTacToe::Markers::O }
      end

      it 'verify and returns the matched cell' do
        expect(to_over_move.call).to eq(2)
      end
    end

    context 'when board haven\'t combinations to match' do
      it 'verify and returns nil' do
        expect(to_over_move.call).to be_nil
      end
    end
  end
end
