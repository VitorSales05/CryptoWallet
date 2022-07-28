namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando DB...")
      spinner.auto_spin
      %x(rails db:drop:_unsafe)
      spinner.success("(Concluído com sucesso!)")
      
      spinner = TTY::Spinner.new("[:spinner] Criando DB...")
      spinner.auto_spin
      %x(rails db:create)
      spinner.success("(Concluído com sucesso!)")
      
      spinner = TTY::Spinner.new("[:spinner] Migrando DB...")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("(Concluído com sucesso!)")
      
      spinner = TTY::Spinner.new("[:spinner] Populando DB...")
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success("(Concluído com sucesso!)")
    else
      puts "Você deve estar no ambiente de desenvolvimento!"
    end
  end

end
