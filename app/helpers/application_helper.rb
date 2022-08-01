# Indicado colocar aqui as helpers que serão utilizadas em toda a aplicação

module ApplicationHelper
  # responsável por informar o idioma utilizado atualmente
  def locale
    I18n.locale == :en ? "Inglês" : "Português-BR"
  end
    
    
  # metodo responsável por formatar as datas na aplicação
  # 'strftime("%d/%m/%Y")' é um helper capaz de formatar datas
  # NÃO ESTÁ SENDO UTILIZADO, pois a data está sendo gerenciada pelo I18l
  def date_br(date_us)
    date_us.strftime("%d/%m/%Y") 
  end
    
    
  def environment_detect
    if Rails.env.production?
      "Produção"
    elsif Rails.env.development?
      "Desenvolvimento"
    else
      "Teste"
    end    
  end
    
end
