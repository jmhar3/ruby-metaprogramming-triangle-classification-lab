class Triangle
  attr_accessor :one, :two, :three

  def initialize one, two, three
    @one = one
    @two = two
    @three = three
  end

  def kind
    triangle = [@one, @two, @three]
    over_0 = triangle.any?{|side| side <= 0}
    valid = @one + @two <= @three || @one + @three <= @two || @three + @two <= @one

    if over_0 || valid
      raise TriangleError
    else
      if @one == @two && @one == @three
        :equilateral 
      elsif @one == @two || @one == @three || @two == @three
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
  end
end