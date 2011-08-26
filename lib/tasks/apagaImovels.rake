 desc "Apaga tabela de imoveis"
  task :apagaImovels => :environment do
    connection = ActiveRecord::Base.connection
    connection.execute("DELETE FROM Imovels")
    puts "* dropped table '#{table}'"
  end