Rails.application.routes.draw do
	root 'homes#top'
	get 'about' => 'homes#about'

	devise_for :admins, controllers: {
		sessions:      'admins/sessions',
	}
	devise_for :members, controllers: {
		sessions:      'members/sessions',
		passwords:     'members/passwords',
		registrations: 'members/registrations'
	}

	namespace :admin do
		get 'top' => 'homes#top'
		resources :members, only: [:index, :show, :edit, :update]
		resources :products
		resources :genres, only: [:new, :create, :index, :edit, :update, :destroy]
		resources :orders, only: [:index, :show, :edit, :update]
		resources :order_products, only: [:update]
	end

	namespace :member do
		get 'withdraw' => 'members#withdraw'
		patch 'delete'  => 'members#delete'
		delete 'empty' => 'cart_products#empty'
		post 'confirm' => 'orders#confirm'
		get 'thanks' => 'orders#thanks'
		resources :members, only: [:show, :edit, :update]
		resources :products, only: [:index, :show]
		resources :cart_products, only: [:create, :index, :update, :destroy]
		resources :orders, only: [:new, :create, :index, :show]
		resources :deliveries, only: [:new, :create, :index, :edit, :update, :destroy]
	end
end
