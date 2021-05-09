module Organizers
  class CreateOrder
    include Interactor::Organizer
        
    organize Interactors::ParseOrder, Interactors::BuildPayload, Interactors::SendOrder
  end
end
