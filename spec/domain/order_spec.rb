require 'spec_helper'

describe Order do
  subject { @order = Order.new }
  it { should be_unconfirmed }
  it "should be persistable"
  it "should be placeble"
  it "should have a bunch of items"
  it "should not be placed when invalid"
  it "should have a status"
  it "should have a payment associated"
  it "should have a shipping_address"
  it "should have a billing_address"
  context "validation" do
    it "should be invalid if the shipping_address has no city"
  end
end

describe LineItem do
  it "should have a name"
  it "should have a price"
  it "should have a quantity"
  it "should have a vat percentage"
  it "should calculate the subtotal price (price * quantity)"
end

describe Payment do
  it "should have UNDEFINED PAID AUTHORIZED NOT_AUTHORIZED PAYMENT_DENIED states"
  it "should be done when status PAID or AUTHORIZED"
  it "should be undone when status UNDEFINED or NOT_AUTHORIZED or PAYMENT_DENIED"
end