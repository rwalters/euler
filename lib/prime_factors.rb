require 'prime'

class PrimeFactors
  attr_reader :factors, :target, :max

  def initialize(n = 1000)
    @target = n
    @max = (n/2).floor

    @factors = []

    calc_factors
  end

  def largest
    factors.last
  end

  private

  def calc_factors
    loop do
      next_prime = primes.next

      break if next_prime > max
      next unless (target % next_prime).zero?

      @factors |= [next_prime]

      other_factor = target / next_prime

      @max = other_factor
      @factors |= [other_factor] if other_factor.prime?
    end
  end

  def primes
    @primes ||= Prime.each
  end
end
