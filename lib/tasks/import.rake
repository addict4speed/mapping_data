require 'csv'

desc "Import trips from csv file"
task :import => [:environment] do
  file = "db/diamond_toronto-2013-06-25.csv"
  CSV.foreach(file, headers: true) do |row|
    if row[0].to_f != 0 and row[6] == "false" 
      Trip.create({
        :latitude => row[0],
        :longitude => row[1],
        :booking_time => row[2],
        :pickup_time => row[3],
        :status => row[4],
        :app => row[5],
        :test => row[6],
        :gmaps => true      
      })
    end 
  end
end
