describe TicTacToe::Drivers::ComputerDriver do
  let :board do
    TicTacToe::Board.new
  end

  let :driver_env do
    TicTacToe::Player::DriverEnv.new(board, TicTacToe::Markers::X)
  end

  let :computer_driver do
    TicTacToe::Drivers::ComputerDriver.new(driver_env)
  end

  describe '#perform' do
    context 'when the board\'s center cell is empty' do
      before do
        move = TicTacToe::ComputerMoves::CenterMove
        allow_any_instance_of(move).to receive(:call).and_return('Center!')
      end

      it 'calls the center_move and returns his strategy' do
        expect(computer_driver.perform).to eq('Center!')
      end
    end

    context 'when the board\'s center cell is not empty' do
      before do
        board[4] = TicTacToe::Markers::O
      end

      context 'when board have combinations to match' do
        before do
          board[3] = TicTacToe::Markers::O
          move = TicTacToe::ComputerMoves::ToOverMove
          allow_any_instance_of(move).to receive(:call).and_return('ToOver!')
        end

        it 'calls the to_over_move and returns his strategy' do
          expect(computer_driver.perform).to eq('ToOver!')
        end
      end

      context 'when board haven\'t combinations to match' do
        context 'when board have available cells' do
          before do
            move = TicTacToe::ComputerMoves::RandomMove
            allow_any_instance_of(move).to receive(:call).and_return('Random!')
          end

          it 'calls the random_move and returns his strategy' do
            expect(computer_driver.perform).to eq('Random!')
          end
        end

        context 'when board haven\'t available cells' do
          before do
            fill_board(board, 9, TicTacToe::Markers::O)
          end

          it 'verify and returns nil' do
            expect(computer_driver.perform).to be_nil
          end
        end
      end
    end
  end
end
