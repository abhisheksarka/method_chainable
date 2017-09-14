module MethodChainable
  class Proxy
    attr_accessor :m_chainable,
                  :output,
                  :input,
                  :m_chain_count

    def initialize(m_chainable, input)
      @m_chainable = m_chainable
      @output = output
      @input = input
      @m_chain_count = 0
    end

    def method_missing(m, *args, &block)
      m = m.to_s
      if m == 'value'
        return output
      else
        if m_chainable.respond_to? m
          arg = (@m_chain_count == 0) ? input : output
          arity = m_chainable.method(m).arity

          if arity > 0
            @output = m_chainable.send(m, arg)
          else
            @output = m_chainable.send(m)
          end

          @m_chain_count += 1

          return self
        else
          super(m, *args, &block)
        end
      end
    end
  end
end
