module Operations
  module Orders
    class CreateOrderOperation
      class << self

        def call(params)
          ActiveRecord::Base.transaction do
            @context = start_operation(params)

            raise ActiveRecord::Rollback if @context.errors.present?
          end

          return @result.assigns(:user, @context.user) if @context.errors.blank?

           @context.errors.each { |error| result.error(error) }
        end

        private

        def start_operation(params)                 
          Organizers::CreateOrder.call(params)
        end 
      end
    end
  end
end
