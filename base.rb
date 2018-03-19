class Base
  def initialize(at = nil)
    if at == nil && block_given?
      yield self
    end
    if at != nil
      assign_attributes(at)
    end
  end

  def assign_attributes(at)
    if at.empty?
      return
    end
    new_at = stringify_keys(at)
    _assign_attributes(new_at)
  end

  private
  def _assign_attributes(at)
    at.each do |a|
      key = a[0]
      value = a[1]
      _assign_attribute(key, value)
    end
  end

  def _assign_attribute(key, value)
    setter = :"#{key}="
    public_send(setter, value)
  end

  def transform_keys(hash)
    result = {}
    hash.each_key do |key|
      s = yield(key)
      result[s] = hash[key]
    end
    return result
  end

  def stringify_keys(hash)
    transform_keys(hash) do |k|
      k.to_s
    end
  end
end

