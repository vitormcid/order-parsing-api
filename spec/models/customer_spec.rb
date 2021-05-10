require 'spec_helper'

describe Customer, type: :model do
  context 'validations' do
    it { should validate_presence_of :externalCode }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :contact }

    it { should respond_to(:orders) }
  end
end
