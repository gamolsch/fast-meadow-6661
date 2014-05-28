def split_location_string(input_string)
  input_string.split(", ")
end

def determine_if_hazardous(location_type_pair)
  location_type_pair[1] != "Hazardous" ? false : true
end

def convert_date_format(date)
  if date == "TBD" || date == "NULL"
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

@gat_haz = Storage.create!(name: "Gatorade Lab, Hazardous", hazardous: true)
@gat_nonhaz = Storage.create!(name: "Gatorade Lab, Non-Hazardous", hazardous: false)
@gat_main = Storage.create!(name: "Gatorade Lab, Main Inventory", hazardous: false)
@pilot_haz =  Storage.create!(name: "Pilot Plant, Hazardous", hazardous: true)
@pilot_nonhaz = Storage.create!(name: "Pilot Plant, Non-Hazardous", hazardous: true)

User.create!(first_name: "Jimmy", last_name: "James")

# 426.times do |x|
#   storage = rand(5) + 1
#   Transaction.create!(user_id: 1, item_id: x + 1, action: "added", ammount_changed: 1000, created_at: (20 * (x + 1)).minutes.ago, storage_id: storage)
#   # Transaction.create!(user_id: 1, item_id: x + 1, action: "removed", ammount_changed: (1..100), created_at: (40 * (x + 1)).minutes.ago, storage_id: x + 1)
#   # Transaction.create!(user_id: 1, item_id: x + 1, action: "expired", ammount_changed: (1..100), created_at: (60 * (x + 1)).minutes.ago, storage_id: x + 1)
#   4.times do
#     p Transaction.create!(user_id: 1, item_id: x + 1, action: "updated", ammount_changed: 1 + rand(100), created_at: (80 * (x + 1)).minutes.ago, storage_id: storage)
#   end
# end

CSV.parse(csv_text, headers: true).each do |row|

  given_name = row[0]
  p "===================================="
  p given_name
  item_params = {manufacturer: row[1], name: row[2], lot_number: row[3], manufactured_on: convert_date_format(row[4]), expired_on: convert_date_format(row[5]), unit_of_measure: "ml"}

  case given_name
    when "Gatorade Lab, Hazardous"
      p "Gatorade Lab, Hazardous"
      @gat_haz.add(item_params)
    when "Gatorade Lab, Non-Hazardous"
      p "Gatorade Lab, Non-Hazardous"
      @gat_nonhaz.add(item_params)
    when "Gatorade Lab, Main Inventory"
      p "Gatorade Lab, Main Inventory"
      @gat_main.add(item_params)
    when "Pilot Plant, Hazardous"
      p "Pilot Plant, Hazardous"
      @pilot_haz.add(item_params)
    when "Pilot Plant, Non-Hazardous"
      p "Pilot Plant, Non-Hazardous"
      @pilot_nonhaz.add(item_params)
  end
end
