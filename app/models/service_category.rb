class ServiceCategory < ActiveRecord::Base
	has_many :rates
	has_many :hairdressers, through: :rates
end
