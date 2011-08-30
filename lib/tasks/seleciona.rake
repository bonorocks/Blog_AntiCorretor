 desc "Seleciona imovel"
  task :seleciona => :environment do
    connection = ActiveRecord::Base.connection
    resultado = connection.execute("SELECT MAX(valor) FROM Imovels")
    puts resultado
    puts "* Dados selecionados!"
  end