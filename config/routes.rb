Rails.application.routes.draw do
  
  # deste modo é criada apenas uma rota espicíficamente
  get 'welcome/index'
  
  # 'resources' faz com que o rails crie todas as rotas possíveis para um controller
  resources :coins
  
  # O 'root to' é responsável por definir qual será a página inicial do site
  root to: 'welcome#index'
  
  
  # For details on the DSL available within this file, see https://guid.rubyonrails.org/routing.html
end
