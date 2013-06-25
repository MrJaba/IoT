class Application < Goliath::API
  include Goliath::Rack::Templates
  plugin Goliath::Plugin::Latency

  # Use the Rack Static middleware to serve static resources
  use(Rack::Static,
      :root => Goliath::Application.app_path("public"),
      :urls => ['/stylesheets', '/javascripts', '/images'])

  # Mount all of our API endpoints
  class API < Grape::API
    mount Endpoint::Devices
    mount Endpoint::PhysicalEntities
    mount Endpoint::VirtualEntities
    mount Endpoint::Data
  end

  def recent_latency
    Goliath::Plugin::Latency.recent_latency
  end

  # Handle the incoming request and provide a response
  def response(env)
    case env['PATH_INFO']
    when '/' 
      [200, {}, haml(:index)]
    else
      API.call(env)
    end
  end
end