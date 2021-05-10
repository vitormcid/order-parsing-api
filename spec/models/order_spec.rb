require 'spec_helper'

describe Order, type: :model do
  context 'validations' do
    it { should validate_presence_of :externalCode }
    it { should validate_presence_of :storeId }
    it { should validate_presence_of :subTotal }
    it { should validate_presence_of :deliveryFee }
    it { should validate_presence_of :total_shipping }
    it { should validate_presence_of :total }
    it { should validate_presence_of :dtOrderCreate }

    it { should respond_to(:address) }
    it { should respond_to(:customer) }
  end
end
