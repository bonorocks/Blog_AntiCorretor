 desc "Apaga  imoveis da tabela"
  task :apagaImovels => :environment do
    connection = ActiveRecord::Base.connection
    connection.execute("DELETE FROM Imovels")
    puts "* Dados de imovels apagados!"
  end