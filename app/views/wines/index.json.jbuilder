json.array!(@wines) do |wine|
  json.extract! wine, :id, :name, :desc, :short_desc, :price, :origin, :vegetarian, :supplier
  json.url wine_url(wine, format: :json)
end
