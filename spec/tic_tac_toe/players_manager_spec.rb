describe TicTacToe::PlayersManager do
  let :board do
    TicTacToe::Board.new
  end

  let :player1 do
    TicTacToe::Player.new(board, TicTacToe::Markers::X, driver_double)
  end

  let :player2 do
    TicTacToe::Player.new(board, TicTacToe::Markers::O, driver_double)
  end

  let :player_manager do
    TicTacToe::PlayersManager.new(player1, player2)
  end

  describe '#current_player' do
    it 'returns the current player, starting on player1 and switching' do
      expect(player_manager.current_player).to eq(player1)
      expect(player_manager.current_player).to eq(player2)
      expect(player_manager.current_player).to eq(player1)
    end
  end
end
