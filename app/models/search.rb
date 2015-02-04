class Search < ActiveRecord::Base

	 def hairdressers
	  @hairdressers ||= find_hairdressers
	 end

	  def pictures
	 	@pictures ||= find_pictures
	 end



	def find_hairdressers
		hairdressers = Hairdresser.order(:first_name)
		# hairdressers = hairdressers.where("available like ?", true) 

   		hairdressers = hairdressers.where("first_name like ?", "%#{first_name}%") if first_name.present?
   		hairdressers = hairdressers.where("price like ?", "%#{price}%") if price.present?
   		hairdressers = hairdressers.where("style like ?", "%#{style}%") if style.present?
   		hairdressers = hairdressers.where("area like ?", "%#{area}%") if area.present?
   		hairdressers
	end

	def find_pictures
		pictures = Picture.order(:imageable_id)
		# pictures = Picture.joins(:hairdresser).where("hairdressers.available like ?", true) 
		pictures = Picture.joins(:categories).where("categories.name like ? ",:"%#{name}%") if name.present?
		
		pictures
	end

end

