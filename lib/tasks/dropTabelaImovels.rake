 desc "Apaga tabela Imovels"
  task :dropTabelaImovels => :environment do
    connection = ActiveRecord::Base.connection
    connection.execute("DROP TABLE Imovels")
    puts "* Dados de imovels apagados!"
  end