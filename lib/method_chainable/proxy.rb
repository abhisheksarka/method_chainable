# This is a proxy class that is used
# to intercept the method calls on the
# actual object


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


    # Overrides method_missing since .chain
    # will return an instance of this

    # On a method call on the chainable object
    # this will intercept it and determine how
    # the call should be made
    # For methods with 0 arity, no need to pass
    # any args

    # Remembers the output of the previous call and
    # passes on to the new one
    def method_missing(m, *args, &block)
      m = m.to_s

      # Return the final output if value is called
      if m == 'val'
        return output
      else

        # Since value is not called yet keep calling
        # the actual method on chainable and pass
        # the previous output

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
