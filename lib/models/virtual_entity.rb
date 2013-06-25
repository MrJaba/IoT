class VirtualEntity < Ohm::Model
  include Iot::UUID
  attribute :uuid
  reference :device, :Device

  def to_hash
    super.merge(uuid: uuid)
  end
end