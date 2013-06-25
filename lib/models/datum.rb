class Datum < Ohm::Model
  include Ohm::Callbacks

  attribute :uuid
  attribute :data_type
  attribute :value
  attribute :datetime
  reference :virtual_entity, :VirtualEntity

  def before_create
    self.uuid = SecureRandom.uuid
    self.datetime = Time.now
  end

  def to_hash
    super.merge(uuid: uuid, data_type: data_type, value: value, 
                datetime: datetime, virtual_entity: virtual_entity.to_hash)
  end
end