module Fastbill
  module Automatic
    class Payment < Base

      attr_reader :payment_id, :invoice_id, :invoice_number, :invoice_url,
                  :total_amount, :currency, :method, :gateway, :reference, :test,
                  :type, :status, :next_event, :created, :level

      def self.create(attributes)
        raise FastbillError.new('Create method not implemented.')
      end

      def self.get(options = {})
        raise FastbillError.new('Get method not implemented.')
      end

    end
  end
end

