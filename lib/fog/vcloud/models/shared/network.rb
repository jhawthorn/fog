require 'fog/model'

module Fog
  module Vcloud
    module Shared

      class Network < Fog::Model

        identity :id

        attribute :name
        attribute :subnet
        attribute :gateway
        attribute :netmask
        attribute :fencemode
        attribute :links

        def ips
          #Until there is a real model for these ?
          connection.get_network_ips(@id).body['IpAddresses']
        end

        private

        def href=(new_href)
          @id = new_href.split('/').last.to_i
        end

        def type=(new_type); end

      end

    end
  end
end