module Endpoint
  class Data < Grape::API
    format :json
    default_format :json

    helpers do
      def add_virtual_entity_to_params
        virtual_entity_id = params['datum'].delete('virtual_entity_id')
        entity = VirtualEntity[virtual_entity_id]
        error! "Unknown Virtual Entity", 404 unless entity
        params['datum'].merge!(virtual_entity: entity)
      end
    end

    resource :data do
      get "/" do
        Datum.all
      end
      
      get "/:id" do 
        Datum[params['id'].to_i]
      end
      
      post "/" do
        add_virtual_entity_to_params
        Datum.create(params['datum'])
      end

      delete "/:id" do 
        Datum[params['id'].to_i].delete
      end
    end

  end
end