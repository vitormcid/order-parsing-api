module Organizers
  class IntegrateOrder
    include Interactor::Organizer
    organize Interactors::ParseOrder, Interactors::BuildPayload, Interactors::SendOrder, Interactors::SaveOrder
  end
end
