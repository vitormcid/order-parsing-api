Rails.application.routes.draw do
	post 'api/orders/integrate_order', to: 'api/orders#integrate_order'
end
