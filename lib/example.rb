class Example
  extend MethodChainable
  class << self
    def increment(n)
      return n+1
    end

    def decrement(n)
      return n-1
    end
  end
end

Example.chain(10).increment.increment.value # 12

Example.chain(10).decrement.decrement.value # 8

Example.chain(10).increment.decrement.value # 10
