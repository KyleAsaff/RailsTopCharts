Rails.application.routes.draw do
  root 'static_pages#paid'
  get 'free' => 'static_pages#free'
  get 'paid' => 'static_pages#paid'
  get 'top_grossing' => 'static_pages#top_grossing'
end
