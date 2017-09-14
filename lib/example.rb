class Example
  extend MethodChainable
  class << self
    def increment(n)
      return n+1
    end

    def decrement(n)
      return n-1
    end

    def mult_by_2(n)
      n*2
    end
  end
end

Example.chain(10).increment.increment.val # 12

Example.chain(10).decrement.decrement.val # 8

Example.chain(10).increment.decrement.val # 10
