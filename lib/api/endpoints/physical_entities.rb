module Endpoint
  class PhysicalEntities < Grape::API
    format :json
    default_format :json

    resource :physical_entities do
      get "/" do
        PhysicalEntity.all
      end
      
      get "/:id" do 
        PhysicalEntity[params['id'].to_i]
      end
      
      post "/" do
        PhysicalEntity.create(params['physical_entity'])
      end

      delete "/:id" do 
        PhysicalEntity[params['id'].to_i].delete
      end
    end

  end
end