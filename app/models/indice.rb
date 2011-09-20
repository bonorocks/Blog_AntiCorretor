class Indice < ActiveRecord::Base
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :check_process => :prevent_geocoding, 
                  :address => "endereco", :normalized_address => "endereco",
                  :msg => "Desculpe, o endereco está ambiguo..."

def prevent_geocoding
  address.blank? || (!lat.blank? && !lng.blank?) 
end

  def gmaps4rails_address
     "#{endereco}"
   end
   
    def gmaps4rails_infowindow
     "<B>#{endereco}</B>"
    end
end
