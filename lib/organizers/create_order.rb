module Organizers
  class CreateOrder
    include Interactor::Organizer
    
    organize Interactors::ParseOrder, Interactors::SendOrder
  end
end
