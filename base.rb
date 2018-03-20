class Base
  def initialize(at = nil)
    #yield self if block_given?
    assign_attributes(at)
  end

  def assign_attributes(at)
    return unless at && at.any?
    _assign_attributes(at)
  end

  private

  def _assign_attributes(at)
    at.each do |method, value|
      next unless respond_to?(method)
      _assign_attribute(method.to_s, value)
    end
  end

  def _assign_attribute(key, value)
    setter = :"#{key}="
    public_send(setter, value)
  end

end
