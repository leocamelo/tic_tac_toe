describe TicTacToe::Face do
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
      allow($stdout).to receive(:puts) { |str| "stdout:#{str}" }
    end

    it 'pass through stdout for output' do
      expect(described_class.output('game over!')).to eq("stdout:\ngame over!")
    end
  end

  describe '#draw_board' do
    before do
      allow(described_class).to receive(:output) { |str| "output:#{str}" }
    end

    it 'outputs gived cells matrix as grid' do
      cells = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]

      grid = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "

      expect(described_class.draw_board(cells)).to eq("output:#{grid}")
    end
  end
end
