Rails.application.routes.draw do
  root 'static_pages#paid'

  get 'static_pages/free'

  get 'static_pages/top_grossing'
end
