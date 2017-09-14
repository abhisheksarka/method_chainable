require "method_chainable/version"
require "method_chainable/proxy"

module MethodChainable
  def chain(input)
    MethodChainable::Proxy.new(self, input)
  end
end
