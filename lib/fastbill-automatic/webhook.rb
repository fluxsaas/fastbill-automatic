module Fastbill
  module Automatic
    class Webhook

      attr_reader :type, :customer, :subscription, :payment

      def initialize(attributes = {})
        set_attributes(attributes)
      end

      def self.parse(params)
        self.new( JSON.parse(params) )
      end

      def set_attributes(attributes)
        attributes.each_pair do |key, value|
          if key == "customer"
            instance_variable_set("@customer", Customer.new(value))
          elsif key == "subscription"
            instance_variable_set("@subscription", Subscription.new(value))
          elsif key == "payment"
            instance_variable_set("@payment", Payment.new(value))
          else
            instance_variable_set("@#{key.downcase}", value)
          end
        end
      end

    end
  end
end
