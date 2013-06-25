module Iot::DateTime
  include Ohm::Callbacks

  def before_create
    self.datetime = Time.now
  end
end