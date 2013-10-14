module Fastbill
  module Automatic
    class Webhook

      attr_reader :type, :customer, :subscription

      def initialize(attributes = {})
        set_attributes(attributes)
      end

      def self.parse(params)
        self.new( JSON.parse(params) )
      end

      def set_attributes(attributes)
        attributes.each_pair do |key, value|
          if key == "customer"
            instance_variable_set("@#{key.downcase}", Customer.new(value))
          elsif key == "subscription"
            instance_variable_set("@#{key.downcase}", Subscription.new(value))
          elsif key == "payment"
            instance_variable_set("@#{key.downcase}", Payment.new(value))
          else
            instance_variable_set("@#{key.downcase}", value)
          end
        end
      end

    end
  end
end
