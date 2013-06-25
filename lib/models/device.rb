class Device < Ohm::Model
  include Iot::UUID
  attribute :name
  attribute :description
  attribute :uuid
  attribute :model_name
  attribute :location
  reference :physical_entity, :PhysicalEntity
  reference :virtual_entity, :VirtualEntity

  attr_writer :physical_entity_attributes 
  attr_writer :virtual_entity_attributes 

  def physical_entity_attributes=(attributes)
    self.physical_entity = PhysicalEntity.create(attributes)
  end

  def virtual_entity_attributes=(attributes)
    @virtual_entity_attributes = attributes
  end

  def after_create
    self.virtual_entity = VirtualEntity.create(device:self)
  end

  def to_hash
    super.merge(name: name, 
                description: description, 
                uuid: uuid, 
                model_name: model_name, 
                location: location,
                physical_entity: physical_entity.to_hash,
                virtual_entity: virtual_entity.to_hash)
  end
end