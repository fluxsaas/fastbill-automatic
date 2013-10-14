require "spec_helper"

describe Fastbill::Automatic::Payment do

  let(:valid_attributes) do
    {
        payment_id: 15716,
        invoice_id: 372928,
        invoice_number: "11",
        invoice_url: "https:\/\/automatic.fastbill.com\/download\/some-weird-id",
        total_amount: 22.61,
        currency: "EUR",
        method: "invoice",
        gateway: nil,
        reference: nil,
        test: 1,
        type: "charge",
        status: "open",
        next_event: "2013-11-14 09:35:54",
        created: "2013-10-14 09:35:54"
    }
  end

  let (:payment) do
    Fastbill::Automatic::Payment.new(valid_attributes)
  end

  describe "#initialize" do
    it "initializes all attributes correctly" do
      payment.payment_id.should eql 15716
      payment.invoice_id.should eql 372928
      payment.invoice_number.should eql "11"
      payment.invoice_url.should eql "https:\/\/automatic.fastbill.com\/download\/some-weird-id"
      payment.total_amount.should eql 22.61
      payment.currency.should eql "EUR"
      payment.method.should eql "invoice"
      payment.gateway.should eql nil
      payment.reference.should eql nil
      payment.test.should eql 1
      payment.type.should eql "charge"
      payment.status.should eql "open"
      payment.next_event.should eql "2013-11-14 09:35:54"
      payment.created.should eql "2013-10-14 09:35:54"
    end
  end

end