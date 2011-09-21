 desc "Checa os indices"
  task :checaIndices => :environment do
    connection = ActiveRecord::Base.connection
    res = connection.execute("SELECT endereco FROM Indices WHERE latitude <> 0.0")
    puts res
  end