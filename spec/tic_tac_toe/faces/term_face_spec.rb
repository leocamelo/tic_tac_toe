describe TicTacToe::Faces::TermFace do
  let :face do
    described_class.new
  end

  describe '#input' do
    before do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('q')
    end

    it 'pass through Kernel instance and format for input' do
      expect(face.input).to eq('q')
    end
  end

  describe '#output' do
    before do
      allow($stdout).to receive(:puts) { |str| "stdout:#{str}" }
    end

    it 'pass through stdout for output' do
      expect(face.output('game over!')).to eq("stdout:\ngame over!")
    end
  end

  describe '#draw_board' do
    before do
      allow(face).to receive(:output) { |str| "output:#{str}" }
    end

    it 'outputs gived cells matrix as grid' do
      cells = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]

      grid = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "

      expect(face.draw_board(cells)).to eq("output:#{grid}")
    end
  end
end
