class Indice < ActiveRecord::Base
    acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :check_process => :prevent_geocoding, 
                  :address => "endereco", :normalized_address => "endereco",
                  :msg => "Desculpe, o endereco esta ambiguo..."

def prevent_geocoding
  address.blank? || (!lat.blank? && !lng.blank?) 
end

  def gmaps4rails_address
     "#{endereco}"
   end
   
    def gmaps4rails_infowindow
     "<B>#{endereco}</B><p>Apt. de #{numqt} quarto(s)</p><p>Valor medio: R$ #{valmed}.000,00 </p><p>Valor/m2: R$ #{valm2med},00</p>"
    end
end
