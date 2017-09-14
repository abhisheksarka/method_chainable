require "method_chainable/version"
require "method_chainable/proxy"

module MethodChainable
  
  # Returns a Proxy object which intercepts
  # method calls using method missing
  def chain(input=nil)
    MethodChainable::Proxy.new(self, input)
  end
end
