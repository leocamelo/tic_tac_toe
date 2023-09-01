describe TicTacToe::Game do
  let :face do
    TicTacToe::Faces::TermFace
  end

  let :driver do
    TicTacToe::Drivers::BaseDriver
  end

  let :game do
    described_class.new(face, driver, driver)
  end

  describe '#run' do
    before do
      allow_any_instance_of(face).to receive(:output)
    end

    it 'prints the game title and game over message' do
      allow_any_instance_of(TicTacToe::GameLoop).to receive(:perform)

      expect_any_instance_of(face).to receive(:output).with(/Tic-Tac-Toe/)
      expect_any_instance_of(face).to receive(:output).with(/Game over/)

      game.run
    end

    it 'performs the game loop' do
      expect_any_instance_of(TicTacToe::GameLoop).to receive(:perform).once
      game.run
    end
  end
end
