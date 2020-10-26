class BoardCase
  attr_accessor :name, :content
  
  def initialize(name)
    @name = name
    @content = " "
  end

  def is_available?
    content == " "
  end
end
