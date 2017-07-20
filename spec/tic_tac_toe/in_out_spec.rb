describe TicTacToe::InOut do
  describe '#input' do
    before do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('q')
    end

    it 'pass through Kernel instance and format for input' do
      expect(described_class.input).to eq('q')
    end
  end

  describe '#output' do
    before do
      allow(STDOUT).to receive(:puts) { |str| "STDOUT #{str}" }
    end

    it 'pass through STDOUT for output' do
      expect(described_class.output('game over!')).to eq('STDOUT game over!')
    end
  end
end
