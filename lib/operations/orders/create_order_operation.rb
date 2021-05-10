module Operations
  module Orders
    class CreateOrderOperation
      class << self

        def call(params)          
          ActiveRecord::Base.transaction do
            @context = start_operation(params)

            raise ActiveRecord::Rollback if @context.errors.present?
          end

          @context
        end

        private

        def start_operation(params)                 
          Organizers::CreateOrder.call(params)
        end 
      end
    end
  end
end
