json.success true
json.data @pairs do |pair|
  json.id pair.id
  json.base pair.base.name
  json.target pair.target.name
  json.rate pair.rate
end