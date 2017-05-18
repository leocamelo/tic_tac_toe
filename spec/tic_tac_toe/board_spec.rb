describe TicTacToe::Board do
  let :board do
    TicTacToe::Board.new
  end

  describe '#to_s' do
    let :empty_board_grid do
      <<~HEREDOC
         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8
      HEREDOC
    end

    it 'returns an empty board grid' do
      expect(board.to_s).to eq(empty_board_grid)
    end
  end

  describe '#[]' do
    it 'returns the referred cell value' do
      8.times { |n| expect(board[n].to_s).to eq(n.to_s) }
    end
  end

  describe '#[]=' do
    before do
      board[4] = TicTacToe::Markers::X
    end

    it 'change the value of a referred cell' do
      expect(board[4].to_s).to eq(TicTacToe::Markers::X)
    end
  end

  describe '#delete_at' do
    before do
      board.tap { |b| b[4] = TicTacToe::Markers::X }.delete_at(4)
    end

    it 'return back the referred cell to empty value' do
      expect(board[4]).to be_empty
    end
  end

  describe '#available_cells' do
    before do
      board[4] = TicTacToe::Markers::X
    end

    it 'returns all empty cells indexes' do
      expect(board.available_cells).to eq([0, 1, 2, 3, 5, 6, 7, 8])
    end
  end
end
