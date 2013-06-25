class MetaData < Ohm::Model
  attribute :descriptor
  attribute :value
  attribute :component_type
  attribute :component_id

  def component
    if component_id && component_type
      Object.const_get(component_type)[component_id]
    end
  end

  def to_hash
    super.merge(descriptor: descriptor, value: value, component: component.to_hash)
  end
end