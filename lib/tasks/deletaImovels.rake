 desc "Apaga tabela Imovels"
  task :deletaImovels => :environment do
    connection = ActiveRecord::Base.connection
    connection.execute("DROP TABLE Imovels")
    puts "* Dados de imovels apagados!"
  end