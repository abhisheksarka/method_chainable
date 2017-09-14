class Example
  extend MethodChainable
  class << self
    def hello
      'hello'
    end

    def space(s)
      s + ' '
    end

    def world(s)
      s + 'world'
    end
  end
end

Example.chain.hello.space.world.value
