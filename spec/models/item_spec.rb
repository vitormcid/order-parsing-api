require 'spec_helper'

describe Item, type: :model do
  context 'validations' do
    it { should validate_presence_of :externalCode }
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }

    it { should respond_to(:order_item) }
  end
end
