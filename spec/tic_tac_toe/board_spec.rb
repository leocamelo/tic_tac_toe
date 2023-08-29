describe TicTacToe::Board do
  let :marker do
    [TicTacToe::Markers::X, TicTacToe::Markers::O].sample
  end

  let :board do
    described_class.new
  end

  describe '#empty_cells' do
    before do
      board.mark_cell!(5, marker)
    end

    it 'returns all empty cell keys' do
      expect(board.empty_cells).to eq([1, 2, 3, 4, 6, 7, 8, 9])
    end
  end

  describe '#empty_cell?' do
    context 'when pointed cell is empty' do
      it 'returns true' do
        expect(board).to be_empty_cell(1)
      end
    end

    context 'when pointed cell is not empty' do
      before do
        board.mark_cell!(1, marker)
      end

      it 'returns false' do
        expect(board).not_to be_empty_cell(1)
      end
    end
  end

  describe '#mark_cell!' do
    it 'fill a pointed cell' do
      expect(board).to be_empty_cell(1)
      board.mark_cell!(1, marker)
      expect(board).not_to be_empty_cell(1)
    end
  end

  describe '#full?' do
    context 'when the board is not fully marked' do
      before do
        8.times { |n| board.mark_cell!(n + 1, marker) }
      end

      it 'checks and returns false' do
        expect(board).not_to be_full
      end
    end

    context 'when the board is fully marked' do
      before do
        9.times { |n| board.mark_cell!(n + 1, marker) }
      end

      it 'checks and returns true' do
        expect(board).to be_full
      end
    end
  end

  describe '#row_match?' do
    context 'when board haven\'t a combination' do
      before do
        2.times { |n| board.mark_cell!(n + 1, marker) }
      end

      it 'checks and returns false' do
        expect(board).not_to be_row_match
      end
    end

    context 'when board have a combination' do
      before do
        3.times { |n| board.mark_cell!(n + 1, marker) }
      end

      it 'checks and returns true' do
        expect(board).to be_row_match
      end
    end
  end

  describe '#clone' do
    it 'returns a fresh board copy' do
      board_clone = board.clone
      board_clone.mark_cell!(1, marker)

      expect(board).to be_empty_cell(1)
      expect(board_clone).not_to be_empty_cell(1)
    end
  end

  describe '#to_grid' do
    it 'returns cells state as grid matrix' do
      board.mark_cell!(3, marker)

      grid = [
        %W[1 2 #{marker}],
        %w[4 5 6],
        %w[7 8 9]
      ]

      expect(board.to_grid).to eq(grid)
    end
  end
end
