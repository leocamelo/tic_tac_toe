module TicTacToe
  class Game
    def initialize
      @board = Board.new
      @computer_marker = Markers::X
      @human_marker = Markers::O
    end

    def run
      puts 'Tic-Tac-Toe!'
      puts @board
      puts 'Enter [0-8]:'

      until @board.over? || @board.tie?
        human_spot
        computer_spot if !@board.over? && !@board.tie?
        puts @board
      end

      puts 'Game over'
    end

    private

    def human_spot
      spot = nil
      spot = board_mark(gets.chomp.to_i, @human_marker) until spot
    end

    def computer_spot
      if @board[4].empty?
        @board[4] = @computer_marker
      else
        available_cells = @board.select(&:empty?).map(&:to_i)
        board_mark(best_move(available_cells), @computer_marker)
      end
    end

    def board_mark(cell, marker)
      return if cell.nil? || !@board[cell].empty?
      @board[cell] = marker
      cell
    end

    def best_move(available_cells)
      best_move = nil

      available_cells.each do |cell|
        @board[cell] = @computer_marker

        if @board.over?
          best_move = cell
        else
          @board[cell] = @human_marker
          best_move = cell if @board.over?
        end

        @board.delete_at(cell)
      end

      best_move || random_move(available_cells)
    end

    def random_move(available_cells)
      available_cells[rand(0..available_cells.count)]
    end
  end
end
