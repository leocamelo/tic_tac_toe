describe TicTacToe::Player do
  let :board do
    TicTacToe::Board.new
  end

  let :player do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  describe '#mark_board!' do
    before do
      player.mark_board!
    end

    it 'performs the driver and mark a cell on board' do
      expect(board[4].to_s).to eq(TicTacToe::Markers::X)
    end
  end

  describe '#enemy_marker' do
    it 'returns the opposite marker' do
      expect(player.enemy_marker).to eq(TicTacToe::Markers::O)
    end
  end
end
