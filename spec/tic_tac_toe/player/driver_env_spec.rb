describe TicTacToe::Player::DriverEnv do
  let :board do
    TicTacToe::Board.new
  end

  let :driver_env do
    described_class.new(board, TicTacToe::Markers::X)
  end

  describe '#enemy_marker' do
    it 'returns the opposite marker' do
      expect(driver_env.enemy_marker).to eq(TicTacToe::Markers::O)
    end
  end
end
