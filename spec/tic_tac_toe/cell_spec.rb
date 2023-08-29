describe TicTacToe::Cell do
  let :cell do
    described_class.new(4)
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
    context 'when cell have a marker as value' do
      before do
        cell.value = TicTacToe::Markers::X
      end

      it 'returns false' do
        expect(cell).not_to be_empty
      end
    end

    context 'when cell haven\'t a marker as value' do
      it 'returns true' do
        expect(cell).to be_empty
      end
    end
  end
end
