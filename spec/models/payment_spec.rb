require 'spec_helper'

describe Payment, type: :model do
  context 'validations' do
    it { should validate_presence_of :kind }
    it { should validate_presence_of :value }

    it { should respond_to(:order) }
  end
end
