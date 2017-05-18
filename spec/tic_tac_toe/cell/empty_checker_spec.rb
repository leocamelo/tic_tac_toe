describe TicTacToe::Cell::EmptyChecker do
  let :cell do
    TicTacToe::Cell.new(4)
  end

  let :empty_checker do
    TicTacToe::Cell::EmptyChecker.new(cell)
  end

  describe '#call' do
    context 'when the subject cell have a marker as value' do
      before do
        cell.value = TicTacToe::Markers::X
      end

      it 'checks and returns false' do
        expect(empty_checker.call).to eq(false)
      end
    end

    context 'when the subject cell haven\'t a marker as value' do
      it 'checks and returns true' do
        expect(empty_checker.call).to eq(true)
      end
    end
  end
end
