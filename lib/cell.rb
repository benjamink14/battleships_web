class Cell
  attr_accessor :content

  def initialize
    @hit = false
    @content = "W"
  end

  def hit
    raise "Cell already hit" if hit?
    if @content.is_a? Ship
      content.hit
    else
      @content = "HE"
    end
    @hit = true
  end

  def hit?
    @hit
  end
end
