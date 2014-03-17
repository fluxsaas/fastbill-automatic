module Fastbill
  module Automatic
    class Invoice < Base
      include Fastbill::Automatic::Services::Update
      include Fastbill::Automatic::Services::Delete
      include Fastbill::Automatic::Services::Complete
      include Fastbill::Automatic::Services::Cancel
      include Fastbill::Automatic::Services::Sign
      include Fastbill::Automatic::Services::Sendbyemail
      include Fastbill::Automatic::Services::Sendbypost
      include Fastbill::Automatic::Services::Setpaid

      attr_accessor :invoice_id, :invoice_number, :customer_id, :month, :year, :state,
                    :type, :customer_costcenter_id, :currency_code, :template_id, :introtext,
                    :invoice_date, :delivery_date, :cash_discount_percent, :cash_discount_days,
                    :eu_delivery, :items, :delete_exiting_items, :recipient, :subject, :message,
                    :receipt_confirmation, :paid_date, :due_date, :address, :address_2, :city,
                    :country_code, :customer_number, :document_url, :first_name, :is_canceled,
                    :last_name, :organization, :salutation, :sub_total, :total, :vat_total, :zipcode

      attr_reader   :remaining_credits
    end
  end
end