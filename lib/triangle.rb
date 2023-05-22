class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
  end

  def kind
    validate_triangle

    case @sides.uniq.size
    when 1
      :equilateral
    when 2
      :isosceles
    when 3
      :scalene
    end
  end

  private

  def validate_triangle
    raise TriangleError, "Enter a valid triangle" if @sides.include?(0)
    raise TriangleError, "Enter a valid triangle" if @sides.any? { |side| side < 0 }
    raise TriangleError, "Enter a valid triangle" unless triangle_inequality?
  end

  def triangle_inequality?
    a, b, c = @sides
    a + b > c && b + c > a && a + c > b
  end

  class TriangleError < StandardError; end
end
