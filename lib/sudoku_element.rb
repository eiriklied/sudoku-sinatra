class SudokuElement
  attr_reader :legal_values, :value
  attr_reader :group, :row, :col
  
  def initialize(row, col, group, value=nil)
    @legal_values = (1..9).to_a
    @row = row
    @col = col
    @group = group
    @value = value
    
    if value
      @legal_values = [value]
    end
  end
  
  def to_i
    @value.to_i
  end
  
  def present?
    @value.present?
  end
  
end