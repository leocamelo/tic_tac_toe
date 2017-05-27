describe TicTacToe::Cell do
  let :cell do
    TicTacToe::Cell.new(4)
  end

  describe '#value=' do
    before do
      cell.value = 7
    end

    it 'sets the cell\'s value as string' do
      expect(cell.value).to eq('7')
    end
  end

  describe '#empty?' do
    let :empty_checker do
      TicTacToe::Cell::EmptyChecker
    end

    it 'calls the EmptyChecker class' do
      expect_any_instance_of(empty_checker).to receive(:call).once
      cell.empty?
    end
  end
end
