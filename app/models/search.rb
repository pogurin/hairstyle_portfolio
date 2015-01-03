class Search < ActiveRecord::Base
	def hairdressers
		@hairdressers ||= find_hairdressers
	end

	def services
		@services ||= find_services
	end

	private

	def find_hairdressers
		hairdressers = Hairdresser.order(:first_name)
		hairdressers = Hairdresser.where("first_name like ?", "%#{keywords}%") if keywords.present?
		# hairdressers = Hairdresser.where(category_id: category_id) if category_id.present?
		hairdressers
	end

	def find_services
		services = Service.where("name like ?", "%#{keywords}%") if keywords.present?
		services
	end

end
