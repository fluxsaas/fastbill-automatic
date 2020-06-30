module Fastbill
  module Automatic
    class Article < Base
      include Fastbill::Automatic::Services::Update

      attr_accessor :article_number,
                    :title,
                    :description,
                    :unit_price,
                    :allow_multiple,
                    :is_addon,
                    :currency_code,
                    :vat_percent,
                    :setup_fee,
                    :subscription_interval,
                    :subscription_number_events,
                    :subscription_trail,
                    :subscription_duration,
                    :subscription_cancellation,
                    :return_url_success,
                    :return_url_cancel,
                    :checkout_url

      attr_reader :article_id

      def self.create(attributes)
        raise FastbillError.new('Create method not implemented.')
      end
    end
  end
end