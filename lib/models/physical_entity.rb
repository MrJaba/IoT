class PhysicalEntity < Ohm::Model
  include Iot::UUID
  attribute :name
  attribute :uuid
  attribute :description
  attribute :location

  def to_hash
    super.merge(name: name, uuid: uuid, description: description, location: location)
  end
end