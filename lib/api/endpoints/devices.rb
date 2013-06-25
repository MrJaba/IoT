module Endpoint
  class Devices < Grape::API
    format :json
    default_format :json

    resource :devices do
      get "/" do
        Device.all
      end
      
      get "/:id" do 
        Device[params['id'].to_i]
      end
      
      post "/" do
        Device.create(params['device'])
      end

      delete "/:id" do 
        Device[params['id'].to_i].delete
      end
    end

  end
end