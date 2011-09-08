desc "gera indices imoveis"
task :geraIndices => :environment do
    
  #Apaga indices antigos
  connection = ActiveRecord::Base.connection
  #connection.execute("DELETE FROM Indices")
  #puts "* Indices antigos apagados!"
 
  end_plano = ["SQN", "CLN", "EQN", "SCRN", "SEPN", "SGAN", "SCLRN", "SHCGN", "SQS", "CLS",
                   "EQS", "CRS", "SHIGS", "SGAS", "SEPS"] 
  end_sw = ["CCSW", "CLSW", "EQRSW ", "EQSW", "CLSW", "QRSW", "EQRSW", "QMSW", "SQSW"]
                   
  num_plano  = [102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116,
                      202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216,
                      302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316,
                      402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416,
                      502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516,
                      702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716,
                      902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916,]
  num_sw = ["01", "02", "03", "04", "05", "06" ]                      
   for numqt in (1..4)
=begin   
    end_plano.each do |item_end|
      num_plano.each do |num| 
        val_med_plano = connection.execute("select avg(VALOR) from imovels where numqt=#{numqt} and (bairro='ASA NORTE' or bairro='ASA SUL') and local like '#{item_end} #{num}%' ")      
        val_med_plano = val_med_plano.to_s.slice(1..7).to_i
       if !val_med_plano.zero?
        puts " VALOR MEDIO DE #{numqt}qt DA #{item_end} #{num} = #{val_med_plano}"
       end          
      end
    end
=end

    end_sw.each do |item_end|
      num_sw.each do |num| 
        val_med_sw = connection.execute("select avg(VALOR) from imovels where numqt=#{numqt} and bairro='SUDOESTE' and local like '#{item_end} #{num}%' ")      
        val_med_sw = val_med_sw.to_s.slice(1..7).to_i
       if !val_med_sw.zero?
        puts " VALOR MEDIO DE #{numqt}qt DA #{item_end} #{num} = #{val_med_sw}"
       end          
      end
    end
  end
end
