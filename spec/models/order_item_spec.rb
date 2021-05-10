require 'spec_helper'

describe OrderItem, type: :model do
  context 'validations' do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :total }

    it { should respond_to(:order) }
    it { should respond_to(:item) }
  end
end
