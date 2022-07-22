# Indicado colocar aqui as helpers que serão utilizadas em toda a aplicação

module ApplicationHelper
    
    # metodo responsável por formatar as datas na aplicação
    # 'strftime("%d/%m/%Y")' é um helper capaz de formatar datas
    def date_br(date_us)
       date_us.strftime("%d/%m/%Y") 
    end
    
end
