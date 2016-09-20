module Fastbill
  module Automatic
    module Request
      class Connection
        attr_reader :https

        def initialize(request_info)
          @info = request_info
        end

        def setup_https
          @https             = Net::HTTP.new(API_BASE, Net::HTTP.https_default_port)
          @https.use_ssl     = true
          @https.verify_mode = OpenSSL::SSL::VERIFY_PEER
          #@https.ca_file     = File.join(ROOT_PATH, "data/fastbill.pem")
        end

        def request
          https.start do |connection|
            https.request(https_request)
          end
        end

        protected

        def https_request
          https_request = Net::HTTP::Post.new(@info.url)
          https_request.basic_auth(Fastbill::Automatic.email, Fastbill::Automatic.api_key)
          body = {service: @info.service}
          if @info.service.include?('.get')
            # build request body with
            # * filter
            # * LIMIT
            # * OFFSET
            body[:filter] = @info.data
            body[:limit]  = @info.limit
            body[:offset] = @info.offset
          else
            body[:data] = @info.data
          end
          https_request.body = body.to_json
          https_request
        end
      end
    end
  end
end
