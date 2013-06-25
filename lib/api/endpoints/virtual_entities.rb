module Endpoint
  class VirtualEntities < Grape::API
    format :json
    default_format :json

    helpers do
      def add_physical_entity_to_params
        physical_entity_id = params['virtual_entity'].delete('physical_entity_id')
        entity = PhysicalEntity[physical_entity_id]
        error! "Unknown Physical Entity", 404 unless entity
        params['virtual_entity'].merge!(physical_entity: entity)
      end
    end

    resource :virtual_entities do
      get "/" do
        VirtualEntity.all
      end
      
      get "/:id" do 
        VirtualEntity[params['id'].to_i]
      end
      
      post "/" do
        add_physical_entity_to_params
        VirtualEntity.create(params['virtual_entity'])
      end

      delete "/:id" do 
        VirtualEntity[params['id'].to_i].delete
      end
    end

  end
end