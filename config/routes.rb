Rails.application.routes.draw do
  root 'app_listing#paid'
  get 'free' => 'app_listing#free'
  get 'paid' => 'app_listing#paid'
  get 'top_grossing' => 'app_listing#top_grossing'
end
