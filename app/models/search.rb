class Search < ActiveRecord::Base

	 def hairdressers
	  @hairdressers ||= find_hairdressers
	 end

	  def pictures
	 	@pictures ||= find_pictures
	 end



	def find_hairdressers
		hairdressers = Hairdresser.order("created_at DESC")
		hairdressers = hairdressers.where(available: true) 
   		hairdressers = hairdressers.where("first_name like ?", "%#{first_name}%") if first_name.present?
   		hairdressers = hairdressers.where("price like ?", "%#{price}%") if price.present?
   		hairdressers = hairdressers.where("style like ?", "%#{style}%") if style.present?
   		hairdressers = hairdressers.where("area like ?", "%#{area}%") if area.present?
   		hairdressers = 
   		hairdressers
	end

	def find_pictures

		# pictures = Picture
		pictures = Picture.joins(:hairdresser).where("hairdressers.available = ?", true).order("created_at DESC")
		# pictures = Picture.joins(:categories).where("categories.name like ? ",:"%#{name}%") if name.present?

		pictures
	end

end

