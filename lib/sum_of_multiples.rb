class SumOfMultiples
  attr_reader :limit

  def initialize(up_to = 1000)
    @limit = up_to
  end

  def sum
    multiples.sum
  end

  private

  def multiples
    (number_range.step(3).to_a | number_range.step(5).to_a)
  end

  def number_range
    (0...limit)
  end
end
