describe TicTacToe::Board::OverChecker do
  let :board do
    TicTacToe::Board.new
  end

  let :over_checker do
    TicTacToe::Board::OverChecker.new(board)
  end

  describe '#call' do
    context 'when the subject board haven\'t a combination' do
      before do
        2.times { |n| board[n] = TicTacToe::Markers::X }
      end

      it 'checks and returns false' do
        expect(over_checker.call).to eq(false)
      end
    end

    context 'when the subject board have a combination' do
      before do
        3.times { |n| board[n] = TicTacToe::Markers::X }
      end

      it 'checks and returns true' do
        expect(over_checker.call).to eq(true)
      end
    end
  end
end
