module Interactors
  class SaveOrder
    include Interactor

    def call
      save_all
    end

    def save_all
      return unless context.order.present?

      save_address
      save_customer
      save_order
      save_payments
      save_items
    end

    def save_order
      @order = Order.where(context.order).first_or_initialize
      @order.address_id = @address.id
      @order.customer_id = @customer.id
      @order.save
    end

    def save_address
      @address = Address.where(context.address).first_or_create
    end

    def save_customer
      @customer = Customer.where(context.customer[:customer]).first_or_create
    end

    def save_payments
      context.payments[:payments].each do |payment|
        payment[:kind] = payment.delete :type
        payment_result = Payment.where(payment).first_or_initialize
        payment_result.order_id = @order.id
        payment_result.save
      end
    end

    def save_items
      context.items[:items].each do |item|
        result_item = Item.where(item.except(:quantity, :total)).first_or_create
        order_item = OrderItem.new(item.except(:externalCode, :name, :price))
        order_item.item_id = result_item.id
        order_item.order_id = @order.id
        order_item.save
      end
    end
  end
end
