describe TicTacToe::Drivers::ComputerDriver::ToOverMove do
  let :board do
    TicTacToe::Board.new
  end

  let :driver_env do
    TicTacToe::Player::DriverEnv.new(board, TicTacToe::Markers::X)
  end

  let :to_over_move do
    TicTacToe::Drivers::ComputerDriver::ToOverMove.new(driver_env)
  end

  describe '#call' do
    context 'when board have combinations to match' do
      before do
        fill_board(board, 2, TicTacToe::Markers::O)
      end

      it 'verify and returns the matched cell' do
        expect(to_over_move.call).to eq(2)
      end
    end

    context 'when board haven\'t combinations to match' do
      it 'verify and returns nil' do
        expect(to_over_move.call).to be_nil
      end
    end
  end
end
