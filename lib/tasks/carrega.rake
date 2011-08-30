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
      bairro = item.at_css(".bairro").text.strip    
      local   = item.at_css(".localizacao").text.strip
      icones = item.search('td.icones')
      
      numqt = icones[0].text.strip
      if !numqt.nil?
        numqt = Integer(numqt)
      else
        numqt = 0
      end
     
      numst = icones[1].text.strip
       if !numst.nil?
        numst = Integer(numst)
      else
        numst = 0
      end
      
      numgar = icones[2].text.strip
      if !numgar.nil?
        numgar = Integer(numgar)
      else
        numgar = 0
      end
      
      area   = item.at_css(".m2").text[/[0-9\.]+/] 
      if !area.nil?
        area = Integer(area)
      else
        area = 0
      end
      
      valor  = item.at_css(".valores").text[/[0-9\.]+/]
      if !valor.nil?
       valor = Integer(valor.delete('.'))
      else
        valor = 0
      end
      valm2 = item.at_css(".v_m2").text[/[0-9\.]+/]
      if !valm2.nil?
        valm2 = Integer(valm2.delete('.'))
      else
        valm2 = 0
      end      
      data    = item.at_css(".atualizacao").text.strip  
      link    = item.css('.localizacao a').map { |link| link['href'] }
      codigo   = link.to_s.slice(-6..-1) 
      
      puts "#{cidade} - #{local} - #{numqt} - #{numst} - #{numgar} - #{area} - #{valor} - #{valm2} - #{data} - #{codigo}"
      
      Imovel.create(
        :cidade => cidade,
        :bairro => bairro,
        :local  => local, 
        :numqt => numqt,
        :numst => numst,
        :numgar => numgar,
        :area  => area,
        :valor  => valor,
        :valm2 => valm2,
        :data   => data,
        :codigo => codigo
      )      
    end  
    num +=1
    puts "PROCESSADA PAG. #{num} !"
  end
end