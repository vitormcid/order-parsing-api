module Parsers
  class ParseAddress
    class << self
      def call(params)
        {
          country: params[:country][:id],
          state: params[:state][:name],
          city: params[:city][:name],
          district: params[:neighborhood][:name],
          street: params[:street_name],
          complement: params[:comment],
          latitude: params[:latitude],
          longitude: params[:longitude],
          postalCode: params[:zip_code],
          number: params[:street_number]
        }
      end
    end
  end
end
