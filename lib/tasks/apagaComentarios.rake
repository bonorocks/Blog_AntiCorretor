 desc "Apaga  comentarios da tabela"
  task :apagaComentarioss => :environment do
    connection = ActiveRecord::Base.connection
    connection.execute("DELETE FROM Comentarios")
    puts "* Dados de comentarios apagados!"
  end