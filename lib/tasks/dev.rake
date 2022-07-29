
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Migrando DB...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_type_mining)
    else
      puts "Você deve estar no ambiente de desenvolvimento!"
    end
  end
  
  desc "Cadastra as cryptomoedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
        {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://toppng.com/public/uploads/thumbnail/bitcoin-png-bitcoin-logo-transparent-background-115629339976fammkuch0.png"
        },
        {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1973.png"
        },
        {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://seeklogo.com/images/D/dash-logo-4A14989CF5-seeklogo.com.png"
        },
        {
            description: "Tether",
            acronym: "USTD",
            url_image: "https://cdn-icons-png.flaticon.com/512/825/825508.png"
        },
        {
            description: "Ripple",
            acronym: "XRP",
            url_image: "https://seeklogo.com/images/R/ripple-xrp-logo-E97D62205B-seeklogo.com.png"
        }
      ]
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
  
  
  desc "Cadastra os tipos de mineração"
  task add_type_mining: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        { description: "Proof of Work", acronym: "PoW" },
        { description: "Proof of Stake", acronym: "PoS" },
        { description: "Proof of Capacity", acronym: "PoC" }
      ]
      mining_types.each do |mining|
        MiningType.find_or_create_by!(mining)
      end
    end
  end
  
  
  
  # 'private' faz com que todos os metodos presentes após ele possas ser utilizados
  # apenas dentro da mesma classe classe
  private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end