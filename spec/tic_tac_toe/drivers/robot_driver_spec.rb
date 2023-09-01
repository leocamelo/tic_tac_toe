describe TicTacToe::Drivers::RobotDriver do
  let :board do
    TicTacToe::Board.new
  end

  let :player_marker do
    TicTacToe::Markers::X
  end

  let :enemy_marker do
    TicTacToe::Markers::O
  end

  let :driver do
    described_class.new(nil)
  end

  describe '#perform' do
    context 'when the board\'s center cell is empty' do
      let :move do
        TicTacToe::Drivers::RobotDriverMoveset::CenterMove
      end

      before do
        allow_any_instance_of(move).to receive(:call).and_return('Center!')
      end

      it 'calls the center_move and returns his strategy' do
        expect(driver.perform(board, player_marker, enemy_marker)).to eq('Center!')
      end
    end

    context 'when the board\'s center cell is not empty' do
      before do
        board.mark_cell!(5, enemy_marker)
      end

      context 'when board have combinations to match' do
        let :move do
          TicTacToe::Drivers::RobotDriverMoveset::ToOverMove
        end

        before do
          board.mark_cell!(4, enemy_marker)
          allow_any_instance_of(move).to receive(:call).and_return('ToOver!')
        end

        it 'calls the to_over_move and returns his strategy' do
          expect(driver.perform(board, player_marker, enemy_marker)).to eq('ToOver!')
        end
      end

      context 'when board haven\'t combinations to match' do
        context 'when board have available cells' do
          let :move do
            TicTacToe::Drivers::RobotDriverMoveset::RandomMove
          end

          before do
            allow_any_instance_of(move).to receive(:call).and_return('Random!')
          end

          it 'calls the random_move and returns his strategy' do
            expect(driver.perform(board, player_marker, enemy_marker)).to eq('Random!')
          end
        end

        context 'when board haven\'t available cells' do
          before do
            markers = [player_marker, enemy_marker].shuffle
            9.times { |n| board.mark_cell!(n + 1, markers[n % markers.size]) }
          end

          it 'verify and returns nil' do
            expect(driver.perform(board, player_marker, enemy_marker)).to be_nil
          end
        end
      end
    end
  end
end
