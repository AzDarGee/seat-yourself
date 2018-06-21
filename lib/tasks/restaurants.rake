namespace :restaurants do
  desc "Set geo coordinates for all restaurants with addresses"
  # Need to load ':environment' so we can make changes to our actual application
  task update_coordinates: :environment do
    restaurants = Restaurant.where(longitude: nil, latitude: nil)
    restaurants.each do |r|
      r.geocode
      if r.save
        puts "#{r.name} was updated!"
      else
        puts "#{r.name}:#{r.id} => Could not be saved!"
      end
    end
  end
end
