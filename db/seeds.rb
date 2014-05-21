def split_location_string(input_string)
  input_string.split(", ")
end

def determine_if_hazardous(location_type_pair)
  location_type_pair[1] != "Hazardous" ? false : true
end

csv_text = File.read("db/mainDB-inventory.csv")

CSV.parse(csv_text).each do |row|
  split_string = split_location_string(row[0])
  is_hazardous = determine_if_hazardous(split_string)
  p Item.create(storage: split_string[0], hazardous: is_hazardous, manufacturer: row[1], name: row[2], lot_number: row[3], manufactured_on: row[4], expired_on: row[5])
end



