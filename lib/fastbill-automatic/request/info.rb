module Fastbill
  module Automatic
    module Request
      class Info
        attr_accessor :service, :data, :limit, :offset

        def initialize(service, data, limit = 30, offset = 0)
          @service = service
          @data    = data
          @limit   = limit
          @offset  = offset
        end

        def url
          url = "/api/#{API_VERSION}/api.php"
          url
        end

        def path_with_params(path, params)
          unless params.empty?
            encoded_params = URI.encode_www_form(params)
            [path, encoded_params].join("?")
          else
            path
          end
        end
      end
    end
  end
end