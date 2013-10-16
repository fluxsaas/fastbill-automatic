require "spec_helper"

describe Fastbill::Automatic::Webhook do

  let!(:subscription_created) do
    {
      id:44140,
      type:"subscription.created",
      customer:{
        customer_id:"2131231231",
        customer_ext_uid:"2321412343",
        hash:"some-secret-hash",
        customer_number:"21",
        companyname:"Demo Data GmbH",
        salutation:"",
        firstname:"Ben",
        lastname:"Stone",
        address:"Demostr. 123",
        address_2:"",
        zipcode:"12345",
        city:"Hamburg",
        country_code:"DE",
        email:"developers@fastbill.com",
        payment_data_url:"https:\/\/automatic.fastbill.com\/accountdata\/some-secret-hash\/some-secret-hash",
        dashboard_url:"https:\/\/automatic.fastbill.com\/dashboard\/some-secret-hash\/some-secret-hash"
      },
      subscription:{
        subscription_id:123123,
        subscription_ext_uid:"",
        hash:"some-secret-hash",
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

  let!(:subscription_changed) do
    {
      id: 44722,
      type: "subscription.changed",
      customer: {
        customer_id: "322082",
        customer_ext_uid: "9655",
        hash: "some-secret-hash",
        customer_number: "22",
        companyname: "Demo Data GmbH",
        salutation: "",
        firstname: "Ben",
        lastname: "Stone",
        address: "Demostr. 123",
        address_2: "",
        zipcode: "12345",
        city: "Hamburg",
        country_code: "DE",
        email: "developers@fastbill.com",
        payment_data_url: "https:\/\/automatic.fastbill.com\/accountdata\/some-secret-hash\/some-secret-hash",
        dashboard_url:"https: \/\/automatic.fastbill.com\/dashboard\/some-secret-hash\/some-secret-hash"
      },
      subscription: {
        subscription_id: 353,
        subscription_ext_uid: "",
        hash: "some-secret-hash",
        article_code: "basic_6_9",
        start_date: "2013-07-02 18:59:18",
        last_event: "2013-10-14 16:02:41",
        next_event: "2014-04-14 16:02:41",
        cancellation_date: "0000-00-00 00:00:00",
        status: "active"
      },
      created: "2013-10-14 16:03:02"
    }.to_json
  end

  let!(:subscription_canceled) do
    {
      id: 44522,
      type: "subscription.canceled",
      customer: {
        customer_id: "322082",
        customer_ext_uid: "9655",
        hash: "some-secret-hash",
        customer_number: "22",
        companyname: "Demo Data GmbH",
        salutation: "",
        firstname: "Ben",
        lastname: "Stone",
        address: "Demostr. 123",
        address_2: "",
        zipcode: "12345",
        city: "Hamburg",
        country_code: "DE",
        email: "developers@fastbill.com",
        payment_data_url: "https: \/\/automatic.fastbill.com\/accountdata\/some-secret-hash\/some-secret-hash",
        dashboard_url: "https: \/\/automatic.fastbill.com\/dashboard\/some-secret-hash\/some-secret-hash"
      },
      subscription: {
        subscription_id: 14404,
        subscription_ext_uid: "",
        hash: "some-secret-hash",
        article_code: "basic_1_9",
        start_date: "2013-10-14 14:06:50",
        last_event: "2013-10-14 14:06:54",
        next_event: "2013-11-14 14:06:54",
        cancellation_date: "2013-11-14 14:06:54",
        status: "canceled"
      },
      created: "2013-10-14 14:12:58"
    }.to_json
  end

  let!(:payment_created) do
    {
      id:44138,
      type:"payment.created",
      customer:{
        customer_id:"2131231231",
        customer_ext_uid:"2321412343",
        hash:"some-secret-hash",
        customer_number:"21",
        companyname:"Demo Data GmbH",
        salutation:"",
        firstname:"Ben",
        lastname:"Stone",
        address:"Demostr. 123",
        address_2:"",
        zipcode:"12345",
        city:"Hamburg",
        country_code:"DE",
        email:"developers@fastbill.com",
        payment_data_url:"https:\/\/automatic.fastbill.com\/accountdata\/some-secret-hash\/some-secret-hash",
        dashboard_url:"https:\/\/automatic.fastbill.com\/dashboard\/some-secret-hash\/some-secret-hash"
      },
      subscription:{
        subscription_id:123123,
        subscription_ext_uid: nil,
        hash:"some-secret-hash",
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

    describe "#created" do

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

    describe "#changed" do

      let (:webhook) do
        Fastbill::Automatic::Webhook.parse(subscription_changed)
      end

      it "should have the correct type" do
        webhook.type.should eq "subscription.changed"
      end

      it "should have a customer" do
        webhook.customer.should be_a Fastbill::Automatic::Customer
      end

      it "should have a subscription" do
        webhook.subscription.should be_a Fastbill::Automatic::Subscription
      end

    end

    describe "#canceled" do

      let (:webhook) do
        Fastbill::Automatic::Webhook.parse(subscription_canceled)
      end

      it "should have the correct type" do
        webhook.type.should eq "subscription.canceled"
      end

      it "should have a customer" do
        webhook.customer.should be_a Fastbill::Automatic::Customer
      end

      it "should have a subscription" do
        webhook.subscription.should be_a Fastbill::Automatic::Subscription
      end

    end

  end

  describe "payment" do

    describe "#created" do

      let (:webhook) do
        Fastbill::Automatic::Webhook.parse(payment_created)
      end

      it "should have the correct type" do
        webhook.type.should eq "payment.created"
      end

      it "should have a customer" do
        webhook.customer.should be_a Fastbill::Automatic::Customer
      end

      it "should have a payment" do
        webhook.payment.should be_a Fastbill::Automatic::Payment
      end

    end

  end

end
