require 'rubygems'
require 'sinatra'
require 'erb'

require 'lib/sudoku_board'
require 'lib/sudoku_element'
require 'lib/logger_helper'
require 'lib/solvers/default_solver'


get '/' do
  @sudoku_board = SudokuBoard.new
  @sudoku_board.board = SudokuBoard.default_board
  
  erb :sudoku
end

post '/board' do
  @sudoku_board = SudokuBoard.new
  @sudoku_board.board = params[:board]

  @solver = DefaultSolver.new
  @solver.solve(@sudoku_board)
  
  erb :sudoku
end


helpers do
  def group_class_name(row, col)
    group = SudokuBoard.group(row, col)
    type = group % 2

    "group-#{type}"
  end
  
  def prev_class_name(row, col)
    @sudoku_board.prev_board.each do |element|
      if element.row == row and element.col == col
        return element.value ? "prev" : ""
      end
    end
    return "" 
  end
end