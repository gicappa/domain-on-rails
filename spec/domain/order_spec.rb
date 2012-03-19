require 'spec_helper'

describe "order" do
  specify { Order.new.total.should eql 10}
  specify do
    order = Order.new.extend Payable
    order.pay.should be_true
  end

end