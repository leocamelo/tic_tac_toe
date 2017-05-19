describe TicTacToe::Game do
  let :game do
    TicTacToe::Game.new
  end

  describe '#run' do
    before do
      allow(STDOUT).to receive(:puts)
      allow_any_instance_of(TicTacToe::GameLoop).to receive(:perform)
    end

    it 'prints the game title' do
      expect { game.run }.to output(/Tic-Tac-Toe/).to_stdout
    end

    it 'performs the game loop' do
      expect_any_instance_of(TicTacToe::GameLoop).to receive(:perform).once
      game.run
    end

    it 'prints the game over message' do
      expect { game.run }.to output(/Game over/).to_stdout
    end
  end
end
