class Rate < ActiveRecord::Base
	belongs_to :hairdresser
	belongs_to :service_category
end
