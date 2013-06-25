module Iot::UUID
  include Ohm::Callbacks

  def before_create
    self.uuid = SecureRandom.uuid
  end
  
end