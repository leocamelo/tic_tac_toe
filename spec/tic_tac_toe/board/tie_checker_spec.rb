describe TicTacToe::Board::TieChecker do
  let :board do
    TicTacToe::Board.new
  end

  let :tie_checker do
    TicTacToe::Board::TieChecker.new(board)
  end

  describe '#call' do
    context 'when the subject board is not fully marked' do
      before do
        fill_board(board, 8, TicTacToe::Markers::X)
      end

      it 'checks and returns false' do
        expect(tie_checker.call).to eq(false)
      end
    end

    context 'when the subject board is fully marked' do
      before do
        fill_board(board, 9, TicTacToe::Markers::X)
      end

      it 'checks and returns true' do
        expect(tie_checker.call).to eq(true)
      end
    end
  end
end
