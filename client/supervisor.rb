require 'celluloid'
require 'httparty'

require_relative '../config/config'
require_relative 'client_device'

class Supervisor

  def supervise!
    begin
      supervision_id = next_device_id
      ClientDevice.supervise_as supervision_id, *next_device_attributes(supervision_id)
      puts "Device #{supervision_id} reporting for duty..."
      register_and_run_device(supervision_id)
      sleep( rand(10) )
    end while true
  end

private

  def next_device_id
    @device_id ||= 0
    @device_id += 1
    @device_id.to_s
  end

  # Generate some device attribtues as test data
  def next_device_attributes(id)
    "name_ID, description_ID, model_ID, location_ID".gsub(/ID/, id).split(",")
  end

  def register_and_run_device(id)
    device = Celluloid::Actor[id]
    device.register
    device.async.run
  end

end

# Only run this if called from Command line
Supervisor.new.supervise! if __FILE__==$0