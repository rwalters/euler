class SumFib
  attr_reader :max

  def initialize(up_to = 1000)
    @max = up_to
  end

  def sum
    total = 0

    loop do
      val = fib.next
      break if val >= max

      total += val
    end

    total
  end

  private

  def fib
    @fib ||= EvenFib.new
  end

  class EvenFib
    def next
      @fib ||= create_fib_iterator

      @fib.next
    end

    private

    def create_fib_iterator
      fib = Fib.new

      Enumerator.new do |y|
        loop do
          val = fib.next
          next unless val.even?

          y << val
        end
      end
    end
  end

  class Fib
    def next
      @fib ||= create_fib_iterator

      @fib.next
    end

    private

    def create_fib_iterator
      curr_idx = -1
      next_val = -> { fib_hash[curr_idx += 1] }

      Enumerator.new do |y|
        loop do
          y << next_val.call
        end
      end
    end

    def fib_hash
      @fib_hash ||=
        Hash.new do |h, k|
          case k
          when 0
            h[k] = 1
          when 1
            h[k] = 1
          else
            h[k] = h[k-1] + h[k-2]
          end
        end
    end
  end
end
