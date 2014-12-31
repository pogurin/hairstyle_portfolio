json.array!(@searches) do |search|
  json.extract! search, :id, :keywords, :category_id, :minimum_price, :maximum_price, :area
  json.url search_url(search, format: :json)
end
