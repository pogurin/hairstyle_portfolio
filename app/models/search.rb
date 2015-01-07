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

	

	# def keyword_conditions
	#   ["hairdressers.area LIKE ?", "%#{area}%"] unless area.blank?
	# end	

	# def category_conditions
	#   ["hairdressers.hairdresser_id = ?", hairdresser_id] unless hairdresser_id.blank?
	# end	

	# def conditions
	#   [conditions_clauses.join(' AND '), *conditions_options]
	# end

	# def conditions_clauses
	#   conditions_parts.map { |condition| condition.first }
	# end

	# def conditions_options
	#   conditions_parts.map { |condition| condition[1..-1] }.flatten
	# end

	# def conditions_parts
	#   private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
	# end	
end
