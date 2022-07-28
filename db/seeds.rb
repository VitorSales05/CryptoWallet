# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cadastrando moedas..."

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


puts "Cadastradas com sucesso!"