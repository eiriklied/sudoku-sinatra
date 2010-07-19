class SudokuBoard
  attr_reader :prev_board
  
  def board=(board_hash)
    @board_elements = convert_from_hash(board_hash)
    @prev_board = SudokuBoard.deep_clone(@board_elements)
  end
  
  def row(row_num)
    row = []
    @board_elements.each do |element|
      if element.row = row_num
        row << element
      end
    end
    row
  end
  
  def col(col_num)
    col = []
    @board_elements.each do |element|
      if element.col = col_num
        col << element
      end
    end
    col
  end
  
  def at(row, col)
    @board_elements.each do |element|
      if element.row == row and element.col == col
        return element
      end
    end
  end
  
  def self.group(row, col)
    row = row.to_i
    col = col.to_i
  
   (row/3)*3 + col/3
  end
  
  def self.default_board
    {
      "0"=>{"0"=>"1", "1"=>"2", "2"=>"3", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "1"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "2"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "3"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "4"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "5"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "6"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "7"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}, 
      "8"=>{"0"=>"", "1"=>"", "2"=>"", "3"=>"", "4"=>"", "5"=>"", "6"=>"", "7"=>"", "8"=>""}
    }
  end
  
  def self.deep_clone(list)
    list.collect do |element|
      element.clone
    end
  end
  
  private
  
  def convert_from_hash(board_hash)
    elements = []
    board_hash.each do |row_key, row_hash|
      row_num = row_key.to_i
      
      row_hash.each do |col_key, col_val|
        col_num = col_key.to_i
        col_val_cleaned = col_val.length > 0 ? col_val.to_i : nil
        group_num = SudokuBoard.group(row_num, col_num)
        element = SudokuElement.new(row_num, col_num, group_num, col_val_cleaned)
        elements << element
      end
    end
    elements
  end
  
end