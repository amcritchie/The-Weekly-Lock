Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'picks#public' # The latest weekly lock.

  get 'pick_latest' => 'weeks#pick_latest' # Propt for user to pick a game from the latest week.

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/falure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'admin' => 'admin#sport'
  get 'admin/nfl' => 'admin#sport'
  get 'admin/:sport/:year' => 'admin#season'
  get 'admin/:sport/:year/:week' => 'admin#week'
  get 'admin/:sport/:year/:week/:slug' => 'admin#game'

  get 'sport/:sport/season/:year/week/:week/public' => 'picks#public'

  get 'sport/:sport/seasons' => 'seasons#index'
  get 'sport/:sport/season/:year/weeks' => 'weeks#index'
  get 'sport/:sport/season/:year/week/:week' => 'games#index'

  post 'build_matchups/:sport/:year/:week' => 'weeks#build_matchups'
end
