describe TicTacToe::ComputerMoves::CenterMove do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  let :center_move do
    TicTacToe::ComputerMoves::CenterMove.new(player)
  end

  describe '#call' do
    context 'when board\'s center cell is empty' do
      it 'verify and returns the center cell' do
        expect(center_move.call).to eq(4)
      end
    end

    context 'when board\'s center cell is not empty' do
      before do
        board[4] = TicTacToe::Markers::O
      end

      it 'verify and returns nil' do
        expect(center_move.call).to be_nil
      end
    end
  end
end