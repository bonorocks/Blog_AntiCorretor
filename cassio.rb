@indices = Indice.all
    @indices.each do |item|
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
      #self.address = "#{item.endereco}" 
      puts "#{endereco}" 
    end