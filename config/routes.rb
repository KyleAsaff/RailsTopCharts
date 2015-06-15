Rails.application.routes.draw do
  root 'apps#paid'
  get 'free' => 'apps#free'
  get 'paid' => 'apps#paid'
  get 'top_grossing' => 'apps#top_grossing'
end
