 desc "Checa os indcies"
  task :checaIndices => :environment do
    connection = ActiveRecord::Base.connection
    res = connection.execute(" select endereco from indices where latitude <> 0.0")
    puts res
  end