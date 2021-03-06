describe TicTacToe::Drivers::ComputerDriver::CenterMove do
  let :board do
    TicTacToe::Board.new
  end

  let :driver_env do
    TicTacToe::Player::DriverEnv.new(board, TicTacToe::Markers::X)
  end

  let :center_move do
    described_class.new(driver_env)
  end

  describe '#call' do
    context 'when board\'s center cell is empty' do
      it 'verify and returns the center cell' do
        expect(center_move.call).to eq(4)
      end
    end

    context 'when board\'s center cell is not empty' do
      before do
        board.cells[4].value = TicTacToe::Markers::O
      end

      it 'verify and returns nil' do
        expect(center_move.call).to be_nil
      end
    end
  end
end
