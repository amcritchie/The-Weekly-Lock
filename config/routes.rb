Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'picks#public'

  get 'sport/:sport/season/:year/week/:week/public' => 'picks#public'

  get 'sport/:sport/seasons' => 'seasons#index'
  get 'sport/:sport/season/:year/weeks' => 'weeks#index'
  get 'sport/:sport/season/:year/week/:week' => 'games#index'

  post 'build_matchups/:sport/:year/:week' => 'weeks#build_matchups'
end
