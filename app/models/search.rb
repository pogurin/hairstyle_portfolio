class Search < ActiveRecord::Base

	 def hairdressers
	  @hairdressers ||= find_hairdressers
	 end

	 def pictures
	 	@pictures ||= find_pictures
	 end

private

	def find_hairdressers
		hairdressers = Hairdresser.order(:first_name)

   		hairdressers = hairdressers.where("first_name like ?", "%#{first_name}%") if first_name.present?
   		hairdressers = hairdressers.where("price like ?", "%#{price}%") if price.present?
   		hairdressers = hairdressers.where("style like ?", "%#{style}%") if style.present?
   		hairdressers = hairdressers.where("area like ?", "%#{area}%") if area.present?
   		hairdressers
	end

	def find_pictures
		pictures = Picture.order(:category_id)
		pictures = pictures.where(category_id: category_id) if category_id.present?
		pictures
	end

end
