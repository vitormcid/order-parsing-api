require 'spec_helper'

describe Address, type: :model do
  context 'validations' do
    it { should validate_presence_of :country }
    it { should validate_presence_of :state }
    it { should validate_presence_of :city }
    it { should validate_presence_of :district }
    it { should validate_presence_of :street }
    it { should validate_presence_of :complement }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :postalCode }
    it { should validate_presence_of :number }

    it { should respond_to(:orders) }
  end
end
