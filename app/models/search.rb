class Search < ActiveRecord::Base
 
	 def hairdressers
	  @hairdressers ||= find_hairdressers
	 end

	private

	def find_hairdressers
		hairdressers = hairdresser.order(:name)
		hairdressers = hairdresser.where("name like ?", "%#{keywords}%") if keywords.present?
	end
end
