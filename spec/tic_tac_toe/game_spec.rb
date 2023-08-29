describe TicTacToe::Game do
  let :game do
    described_class.new
  end

  let :face do
    TicTacToe::Face
  end

  describe '#run' do
    before do
      allow(face).to receive(:output)
    end

    it 'prints the game title and game over message' do
      allow_any_instance_of(TicTacToe::GameLoop).to receive(:perform)

      expect(face).to receive(:output).with(/Tic-Tac-Toe/)
      expect(face).to receive(:output).with(/Game over/)

      game.run
    end

    it 'performs the game loop' do
      expect_any_instance_of(TicTacToe::GameLoop).to receive(:perform).once
      game.run
    end
  end
end
