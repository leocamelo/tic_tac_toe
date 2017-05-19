describe TicTacToe::Cell do
  let :cell do
    TicTacToe::Cell.new(4)
  end

  describe '#to_s' do
    it 'returns the cell\'s value on string format' do
      expect(cell.to_s).to eq('4')
    end
  end

  describe '#to_i' do
    it 'returns the cell\'s value on integer format' do
      expect(cell.to_i).to eq(4)
    end
  end

  describe '#value=' do
    before do
      cell.value = 7
    end

    it 'change the cell\'s value' do
      expect(cell.to_s).to eq('7')
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
