json.success true
json.data @currencies do |currency|
  json.id currency.id
  json.name currency.name
  json.description currency.description
end
