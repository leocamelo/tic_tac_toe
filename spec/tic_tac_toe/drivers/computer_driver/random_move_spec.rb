describe TicTacToe::Drivers::ComputerDriver::RandomMove do
  let :board do
    TicTacToe::Board.new
  end

  let :driver_env do
    TicTacToe::Player::DriverEnv.new(board, TicTacToe::Markers::X)
  end

  let :random_move do
    described_class.new(driver_env)
  end

  describe '#call' do
    context 'when board have available cells' do
      before do
        fill_board(board, 4, TicTacToe::Markers::O)
      end

      it 'verify and returns a random available cell' do
        expect(random_move.call).to be_between(4, 8)
      end
    end

    context 'when board haven\'t available cells' do
      before do
        fill_board(board, 9, TicTacToe::Markers::O)
      end

      it 'verify and returns nil' do
        expect(random_move.call).to be_nil
      end
    end
  end
end
