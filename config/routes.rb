Rails.application.routes.draw do
  root "static_pages#home"
  get "about_us" => "static_pages#about_us"
  get "research" => "static_pages#research"
  get "spelling-bee" => "static_pages#spelling_bee"
  get "our_approach" => "static_pages#our_approach"
  get "results" => "static_pages#results"
  get "feedback" => "static_pages#feedback"
  get "search" => "searches#search"
  get "search_results" => "searches#results"
  get "settings" => "current_users#settings"
  get "progress" => "current_users#progress"
  get "myLeksi" => "my_leksi#index"
  get "myLeksi/names" => "my_leksi#names"
  get "myLeksi/:id" => "my_leksi#show"
  get "myTags" => "my_tags#index"
  get "myTags/:id" => "my_tags#show"
  get "jeopardy_tag" => "tag_games#jeopardy"
  get "gamezone" => "games#gamezone"
  get "fundamentals" => "games#fundamentals"
  get "jeopardy" => "games#jeopardy"
  get "freestyle" => "games#freestyle"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  post "static_pages/contact_us"
  delete "logout" => "sessions#destroy"
  resources :users, except: [:index]
  resources :words, only: [:show]
  resources :words do
    resources :examples
  end
  get "thesaurus/:word_name" => "words#thesaurus"
  resources :words do
    resources :meaning_alts, only: [:index]
  end
  resources :words do
    resources :example_non_examples, only: [:index]
  end
  resources :words do
    resources :sent_stems, only: [:index]
  end
  resource :user_word, only: [:create, :update, :destroy]
  resource :user_points, only: [:update]
  resource :jeopardy_game, only: [:create, :update, :destroy]
  resource :freestyle_game, only: [:create, :update]
  resource :game_stat, only: [:update]
  resource :jeopardy_result, only: [:update]
  resources :tags, except: [:destroy]
  resource :user_tag, only: [:create, :edit, :destroy]
  resource :word_tag, only: [:create, :destroy]
  resource :user_word_tag, only: [:create, :edit, :destroy]
  resource :user_word_tag_word_show_page, only: [:destroy]
  resource :user_word_tag_tag_show_page, only: [:destroy]
  namespace :games do
    resources :word_relationships, only: [:index]
    resources :describe_mes, only: [:index]
  end
  namespace :school do
    root "current_user#classes"
    get "classes" => "current_user#classes"
    get "words" => "current_user#words"
    get "seventh_grade/example_non_examples" => "example_non_examples#seventh_grade"
    get "search" => "searches#search"
    get "search_results" => "searches#results"
    get "search_words_for_students" => "searches#student_words"
    get "student_words" => "words#student_words"
    get "frayer" => "words#frayer_model"
    get "students" => "current_user#students"
    get "student" => "current_user#student"
    get "messages" => "current_user#messages"
    get "progress" => "current_user#progress"
    get "settings" => "current_user#settings"
    get "my_meaning_alts" => "current_user#my_meaning_alts"
    resources :words, only: [:new, :create]
    resource :add_words_for_student, only: [:update]
    resources :example_non_examples
    resources :word do
      resources :example_non_examples
    end
    resources :meaning_alts
    resources :word do
      resources :meaning_alts
    end
  end
  namespace :admin do
    root "admins#settings"
    get "stats" => "admins#stats"
    get "search" => "searches#search"
    get "search_results" => "searches#results"
    get "settings" => "admins#settings"
    resources :users
    resources :words
    resources :meaning_alts
    resources :example_non_examples
  end
end
