describe TicTacToe::Player do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    described_class.new(board, TicTacToe::Markers::X, driver_double)
  end

  describe '#mark_board!' do
    context 'performing the driver' do
      before do
        player.perform_driver!
        player.mark_board!
      end

      it 'mark a cell on board' do
        expect(board.cells[0].value).to eq(TicTacToe::Markers::X)
      end
    end

    context 'without performing the driver' do
      before do
        player.mark_board!
      end

      it 'dont mark any cell on board' do
        expect(board.cells).to all(be_empty)
      end
    end
  end
end
