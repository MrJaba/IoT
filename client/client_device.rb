class ClientDevice
  include Celluloid
  include HTTParty

  format :json

  API = Iot::Config[:api]

  attr_accessor :running

  def initialize(name, description, model, location)
    @name = name
    @description = description
    @model = model
    @location = location
  end

  # Register the Device
  # Needs to create the Entites
  def register
    physical_entity = {name: @name, description: @description, location:@location}
    virtual_entity = {uuid: nil}
    body = {body: {device: {name: @name, 
                            description: @description, 
                            model_name: @model, 
                            location: @location,
                            physical_entity_attributes: physical_entity,
                            virtual_entity_attributes: virtual_entity}}}
    response = self.class.post(API+'/devices', body)
    @uuid = response['uuid']
  end

  def run
    self.running = true
    begin 
      transmit_data
      sleep( sleep_time )
    end while running
  end

  def stop
    self.running = false
  end

private

  # Send the random data to the API
  def transmit_data
    body = {body: {datum:{data_type:"float", value: rand, virtual_entity_id: 1}}}
    self.class.post(API+'/data', body)
  end

  # Sleep for a random fraction of a second
  def sleep_time
    1.0/(rand(10) + 1)
  end

end