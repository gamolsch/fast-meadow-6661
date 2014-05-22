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

csv_text = File.read("db/mainDB-inventory.csv")

p Storage.create!(name: "Gatorade Lab", hazardous: true)
p Storage.create!(name: "Gatorade Lab", hazardous: false)
p Storage.create!(name: "Gatorade Lab", hazardous: false)
p Storage.create!(name: "Pilot Plant", hazardous: true)
p Storage.create!(name: "Pilot Plant", hazardous: true)

5.times do |color|
  p Category.create!(color: "red", storage_id: color)
  p Category.create!(color: "blue", storage_id: color)
  p Category.create!(color: "orange", storage_id: color)
  p Category.create!(color: "yellow", storage_id: color)
  p Category.create!(color: "green", storage_id: color)
  p Category.create!(color: "indigo", storage_id: color)
  p Category.create!(color: "purple", storage_id: color)
  p Category.create!(color: "pink", storage_id: color)
end

CSV.parse(csv_text, headers: true).each do |row|
  # split_string = split_location_string(row[0])
  # is_hazardous = determine_if_hazardous(split_string)
  p Item.create(category_id: rand(1..40), manufacturer: row[1], name: row[2], lot_number: row[3], manufactured_on: convert_date_format(row[4]), expired_on: convert_date_format(row[5]))
end



