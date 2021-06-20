require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product name" do
    subject.product_name = nil
    expect(subject).not_to be_valid
  end
  it "is not valid without a product count" do
    subject.product_count = nil
    expect(subject).not_to be_valid
  end
  it "is not valid with a negative product count" do
    subject.product_count = -11
    expect(subject).not_to be_valid
  end
  it "is not valid with an invalid customer_id" do
    subject.customer_id = 239825
    expect(subject).not_to be_valid
  end
end
