class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @minha_idade = params[:idade]
  end
end
