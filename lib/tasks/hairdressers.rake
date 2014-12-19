namespace :hairdressers do
	desc "update restaurants with empty coordinates"
	task :update_coordinates => :environment do
		hairdressers = Hairdresser.where(latitude: nil, longitude: nil)

		hairdressers.each do |hairdresser|
			hairdresser.geocode

			if hairdresser.save 
				puts "#{hairdresser.first_name} #{hairdresser.last_name} was successfully updated"
			else
				puts "Error: #{hairdresser.first_name} with id #{hairdresser.id}"
			end
		end
	end
end
