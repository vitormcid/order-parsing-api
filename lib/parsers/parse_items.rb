module Parsers
  class ParseItems
    class << self
      def call(params)
        parsed_items = []

        params.each do |order_item|         
          parsed_items <<
          {
            externalCode:  order_item[:item][:id],
            name:          order_item[:item][:title],
            price:         order_item[:unit_price],
            quantity:      order_item[:quantity],
            total:         order_item[:full_unit_price]
          }
        end

        {items: parsed_items}
      end
    end
  end
end
