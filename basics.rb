require 'sinatra'
require 'geocoder'
require 'timezone'
#require '12_hour_time'


Timezone::Configure.begin do |login|
login.username = 'shinpld' 
end

get '/' do
erb :form
end


post '/form' do

city = params[:message]
timezone = Timezone::Zone.new(:latlon => Geocoder.coordinates(city.capitalize))
currentTime = timezone.time Time.now
splittedTime = currentTime.to_s.split(' ')
time = splittedTime[1].split(':')
hour = time[0].to_i
minute = time[1]

"The current time in #{city} is #{hour}:#{minute} "
end