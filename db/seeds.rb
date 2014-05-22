def split_location_string(input_string)
  input_string.split(", ")
end

def determine_if_hazardous(location_type_pair)
  location_type_pair[1] != "Hazardous" ? false : true
end

def convert_date_format(date)
  if date = "TBD" || date = "NULL"
    return "01/01/1900"
  else
    return DateTime.strptime(date, "%m/%d/%Y").strftime("%d/%m/%Y")
  end
end

csv_text = File.read("db/mainDB-inventory.csv")

storage_one = Storage.create!(name: "Gatorade Lab", hazardous: true)
storage_two = Storage.create!(name: "Gatorade Lab", hazardous: false)
storage_three = Storage.create!(name: "Gatorade Lab", hazardous: false)
storage_four = Storage.create!(name: "Pilot Plant", hazardous: true)
storage_five = Storage.create!(name: "Pilot Plant", hazardous: true)

def determine_storage_loc(location)
  case location
  when "Gatorade Lab, Hazardous"
    return 1
  when "Gatorade Lab, Non-Hazardous"
    return 2
  when "Gatorade Lab, Main Inventory"
    return 3
  when "Pilot Plant, Hazardous"
    return 4
  when "Pilot Plant, Non-Hazardous"
    return 5
  end

end

CSV.parse(csv_text, headers: true).each do |row|
  # split_string = split_location_string(row[0])
  # is_hazardous = determine_if_hazardous(split_string)
  p Item.create(storage_id: determine_storage_loc(row[0]), manufacturer: row[1], name: row[2], lot_number: row[3], manufactured_on: convert_date_format(row[4]), expired_on: convert_date_format(row[5]))
end



