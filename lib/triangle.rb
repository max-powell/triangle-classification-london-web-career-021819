require 'pry'

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    @side1 + @side2 > @side3 &&
    @side1 + @side3 > @side2 &&
    @side2 + @side3 > @side1
  end

  def equilateral?
    @side1 == @side2 &&
    @side2 == @side3
  end

  def isosceles?
    sorted = [@side1, @side2, @side3].sort
    sorted[1] == sorted [2] &&
    sorted[1] != sorted [0]
  end

  def scalene?
    sides = [@side1, @side2, @side3]
    sides.uniq.count == 3
  end

  def kind
    if valid?
      case
      when equilateral?
        :equilateral
      when isosceles?
        :isosceles
      when scalene?
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end
