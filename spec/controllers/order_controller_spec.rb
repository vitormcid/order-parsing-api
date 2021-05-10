require 'rails_helper'

RSpec.describe Api::OrdersController , type: :controller do
  let(:response) { post :integrate_order }	
	let(:stub) { double('interactor') }

  describe 'POST #orders_controller' do
    before do    	
    	allow(Organizers::IntegrateOrder).to receive(:call).and_return(stub)    	
    	allow(stub).to receive(:errors).and_return(errors)    	
    	allow(stub).to receive(:response).and_return(true)    	
    end

    context 'when the parameters are correct' do           
      	let(:errors){ nil}       
       	
      	it { expect(response.status).to eq(200) }     
    end

    context 'when the parameters are incorrect' do      
       let(:errors) { 'invalid parameters' }

       it { expect(response.status).to eq(400) }    
    end
  end
end
