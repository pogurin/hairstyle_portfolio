class Search < ActiveRecord::Base

	 def hairdressers
	  @hairdressers ||= find_hairdressers
	 end

private

	def find_hairdressers
		hairdressers = Hairdresser.order(:first_name)

   		hairdressers = hairdressers.where("first_name like ?", "%#{first_name}%") if first_name.present?
   		hairdressers = hairdressers.where("price like ?", "%#{price}%") if price.present?
   		hairdressers = hairdressers.where("style like ?", "%#{style}%") if style.present?
   		hairdressers = hairdressers.where("area like ?", "%#{area}%") if area.present?
   		hairdressers

		  # Hairdresser.find(:all, :conditions => conditions)

		# hairdressers = Hairdresser.order(:first_name)
		# hairdressers = hairdressers.where("name like ?", "%#{first_name}%") if first_name.present?
		# hairdressers = hairdressers.where("area like ?", "%#{area}%") if area.present?
		# hairdressers = hairdressers.where(hairdresser_id: hairdresser_id) if hairdresser_id.present?
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
