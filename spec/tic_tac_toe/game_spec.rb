describe TicTacToe::Game do
  let :game do
    described_class.new
  end

  let :io do
    TicTacToe::InOut
  end

  describe '#run' do
    before do
      allow(io).to receive(:output)
      allow_any_instance_of(TicTacToe::GameLoop).to receive(:perform)
    end

    it 'prints the game title and game over message' do
      expect(io).to receive(:output).with(/Tic-Tac-Toe/)
      expect(io).to receive(:output).with(/Game over/)
      game.run
    end

    it 'performs the game loop' do
      expect_any_instance_of(TicTacToe::GameLoop).to receive(:perform).once
      game.run
    end
  end
end
