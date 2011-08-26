desc "Carrega imoveis"
task :carrega => :environment do
  require 'rubygems'  
  require 'nokogiri'  
  require 'open-uri'     
   
  url = "http://www.wimoveis.com.br/df/brasilia/apartamento/venda/?bairro=todos&busca=lista&quarto=todos&o=F&pronto=1"
  doc = Nokogiri::HTML(open(url))  

  numpag = doc.css('.paginacao_texto span')[1].text.to_i 
  num = 0

  while num < numpag
    url = "http://www.wimoveis.com.br/df/brasilia/apartamento/venda/"+
           "?bairro=todos&busca=lista&quarto=todos&o=F&pronto=1&pg=" + num.to_s

    doc = Nokogiri::HTML(open(url))
    cidade = doc.css("html body form#aspnetForm div.cabecalho div.cabecalho_content h1 b").text
    cidade = cidade.slice(12..cidade.index(",")-1)
    doc.css(".listagem_item").each do |item|
      bairro = item.at_css(".bairro").text
      bairro = bairro.gsub(/^ \n/,'').gsub(/^ */,'').gsub(/ *$/,'')    
      txt   = item.at_css(".localizacao").text
      local = txt.gsub(/^ */,'').gsub(/ *$/,'')
      area   = item.at_css(".m2").text[/[0-9\.]+/] 
      valor  = item.at_css(".valores").text[/[0-9\.]+/]
      valm2 = item.at_css(".v_m2").text[/[0-9\.]+/]
      dat    = item.at_css(".atualizacao").text[/ \d.(\/|-|\.|\s).\d(\/|-|\.|\s)\d{2,4}/]
      link    = item.css('.localizacao a').map { |link| link['href'] }
      cod   = link.to_s.slice(-6..-1)  
      puts "#{cidade} - #{bairro} - #{local} - #{area} - #{valor} - #{valm2} - #{dat} - #{cod}"
      
      Imovel.create(
        :cidade => cidade,
        :bairro => bairro,
        :local  => local, 
        :area  => area,
        :valor  => valor,
        :valm2 => valm2,
        :data   => dat,
        :codigo => cod
      )      
    end  
    num +=1
  end
end