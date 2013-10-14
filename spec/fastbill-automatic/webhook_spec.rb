require "spec_helper"

describe Fastbill::Automatic::Webhook do

  let!(:subscription_created) do
    {
      id:44140,
      type:"subscription.created",
      customer:{
        customer_id:"321862",
        customer_ext_uid:"6191",
        hash:"a2c1e189660f611af2e1df219a128645",
        customer_number:"21",
        companyname:"JimFish",
        salutation:"",
        firstname:"kalle",
        lastname:"Saas",
        address:"Schulterblatt 10",
        address_2:"",
        zipcode:"20357",
        city:"Hamburg",
        country_code:"DE",
        email:"admin@easypep.de",
        payment_data_url:"https:\/\/automatic.fastbill.com\/accountdata\/7ccbc6b2183eb16ea87542ce5a8048e4\/a2c1e189660f611af2e1df219a128645",
        dashboard_url:"https:\/\/automatic.fastbill.com\/dashboard\/7ccbc6b2183eb16ea87542ce5a8048e4\/a2c1e189660f611af2e1df219a128645"
      },
      subscription:{
        subscription_id:14290,
        subscription_ext_uid:"",
        hash:"892ec0d09217aca514cd85b9d78047c0",
        article_code:"basic_1_9",
        start_date:"2013-10-14 09:35:54",
        last_event:"2013-10-14 09:35:54",
        next_event:"2013-11-14 09:35:54",
        cancellation_date:"0000-00-00 00:00:00",
        status:"active"
      },
      created:"2013-10-14 09:35:56"
    }.to_json
  end

  let!(:payment_created) do
    {
      id:44138,
      type:"payment.created",
      customer:{
        customer_id:"321862",
        customer_ext_uid:"6191",
        hash:"a2c1e189660f611af2e1df219a128645",
        customer_number:"21",
        companyname:"JimFish",
        salutation:"",
        firstname:"kalle",
        lastname:"Saas",
        address:"Schulterblatt 10",
        address_2:"",
        zipcode:"20357",
        city:"Hamburg",
        country_code:"DE",
        email:"admin@easypep.de",
        payment_data_url:"https:\/\/automatic.fastbill.com\/accountdata\/7ccbc6b2183eb16ea87542ce5a8048e4\/a2c1e189660f611af2e1df219a128645",
        dashboard_url:"https:\/\/automatic.fastbill.com\/dashboard\/7ccbc6b2183eb16ea87542ce5a8048e4\/a2c1e189660f611af2e1df219a128645"
      },
      subscription:{
        subscription_id:14290,
        subscription_ext_uid: nil,
        hash:"892ec0d09217aca514cd85b9d78047c0",
        article_code:"basic_1_9"
      },
      payment:{
        payment_id:15716,
        invoice_id:372928,
        invoice_number:"11",
        invoice_url:"https:\/\/automatic.fastbill.com\/download\/fGGMQs0UBRAUiTTeoDnhjPpKhGwefvx-23JFh-aiNa3wtIMUMz2vBd6iko.BWv.K",
        total_amount:22.61,
        currency:"EUR",
        method:"invoice",
        gateway:nil,
        reference:nil,
        test:1,
        type:"charge",
        status:"open",
        next_event:"2013-11-14 09:35:54",
        created:"2013-10-14 09:35:54"
      },
      created:"2013-10-14 09:35:55"
    }.to_json
  end


  describe "subscription" do

    describe "parse" do

      let (:webhook) do
        Fastbill::Automatic::Webhook.parse(subscription_created)
      end

      it "should have the correct type" do
        webhook.type.should eq "subscription.created"
      end

      it "should have a customer" do
        webhook.customer.should be_a Fastbill::Automatic::Customer
      end

      it "should have a subscription" do
        webhook.subscription.should be_a Fastbill::Automatic::Subscription
      end

    end

  end

end
