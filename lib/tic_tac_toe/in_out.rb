module TicTacToe
  class InOut
    def self.input
      gets(chomp: true)
    end

    def self.output(str)
      puts(str)
    end
  end
end
