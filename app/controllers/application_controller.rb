class ApplicationController < ActionController::Base

# Manipula o idioma do site pelos parâmentro passados através da URL
# Faz com que o método 'set_location' seja executado antes de tudo
  before_action :set_locale
  
  def set_locale 
    if params[:locale]
      cookies[:locale] = params[:locale]
    end
    
    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end
  end

end
