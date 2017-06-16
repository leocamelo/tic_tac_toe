describe TicTacToe::Board do
  let :board do
    described_class.new
  end

  describe '#cells_grid' do
    context 'when board is empty' do
      let :empty_board_cells_grid do
        <<~HEREDOC
           0 | 1 | 2
          ===+===+===
           3 | 4 | 5
          ===+===+===
           6 | 7 | 8
        HEREDOC
      end

      it 'returns an empty board grid' do
        expect(board.cells_grid).to eq(empty_board_cells_grid)
      end
    end

    context 'when board have marks' do
      before do
        board.cells[2].value = TicTacToe::Markers::X
        board.cells[4].value = TicTacToe::Markers::O
      end

      let :marked_board_cells_grid do
        <<~HEREDOC
           0 | 1 | X
          ===+===+===
           3 | O | 5
          ===+===+===
           6 | 7 | 8
        HEREDOC
      end

      it 'returns the marked board grid' do
        expect(board.cells_grid).to eq(marked_board_cells_grid)
      end
    end
  end

  describe '#empty_cell_at' do
    before do
      board.cells[4].value = TicTacToe::Markers::X
      board.empty_cell_at(4)
    end

    it 'return back the referred cell to empty value' do
      expect(board.cells[4]).to be_empty
    end
  end

  describe '#available_cells' do
    before do
      board.cells[4].value = TicTacToe::Markers::X
    end

    it 'returns all empty cells indexes' do
      expect(board.available_cells).to eq([0, 1, 2, 3, 5, 6, 7, 8])
    end
  end

  describe '#full?' do
    context 'when the board is not fully marked' do
      before do
        fill_board(board, 8, TicTacToe::Markers::X)
      end

      it 'checks and returns false' do
        expect(board.full?).to eq(false)
      end
    end

    context 'when the board is fully marked' do
      before do
        fill_board(board, 9, TicTacToe::Markers::X)
      end

      it 'checks and returns true' do
        expect(board.full?).to eq(true)
      end
    end
  end

  describe '#row_match?' do
    let :row_match_checker do
      described_class::RowMatchChecker
    end

    it 'calls the RowMatchChecker class' do
      expect_any_instance_of(row_match_checker).to receive(:call).once
      board.row_match?
    end
  end
end
