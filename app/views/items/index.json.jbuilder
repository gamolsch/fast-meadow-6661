json.array!(@items) do |item|
  json.extract! item, :id, :storage, :hazardous, :manufacturer, :name, :lot_number, :manufactured_on, :expired_on
  json.url item_url(item, format: :json)
end
