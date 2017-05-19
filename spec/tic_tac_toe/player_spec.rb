describe TicTacToe::Player do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  describe '#mark_board!' do
    context 'performing the driver' do
      before do
        player.perform_driver!
        player.mark_board!
      end

      it 'mark a cell on board' do
        expect(board[0].to_s).to eq(TicTacToe::Markers::X)
      end
    end

    context 'without performing the driver' do
      before do
        player.mark_board!
      end

      it 'dont mark any cell on board' do
        expect(board).to all(be_empty)
      end
    end
  end
end
