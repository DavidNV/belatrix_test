class Base
  def initialize(at = nil)
    yield self if block_given?
    assign_attributes(at)
  end

  def assign_attributes(at)
    return unless at && at.any?
    _assign_attributes(at)
  end

  private

  def _assign_attributes(at)
    at.each do |method, value|
      _assign_attribute(method.to_s, value)
    end
  end

  def _assign_attribute(method, value)
    setter = :"#{method}="
    public_send(setter, value)
  end

  def method_missing(method_sym, *args, &block)
    if self.respond_to?(method_sym)
      method_sym(args.first)
    end
  end
end
