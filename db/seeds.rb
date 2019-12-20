require_relative './parksData.rb'
require 'byebug'

# User Seeds
will = User.create(name: "Will", username: "GrillMasterWill", password: "1234")

# Parks Seeds
@parks.map do |park|
    Park.create(name: park[:fullName], state: park[:states], url: park[:url], description: park[:description], image: park[:images][0][:url], lat: park[:latLong].split(' ')[0].split(':')[1].to_f, long:  park[:latLong].split(' ')[1].split(':')[1].to_f)
end

