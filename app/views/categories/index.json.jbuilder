json.array!(@categories) do |category|
  json.extract! category, :id, :name, :sort_num
  json.url category_url(category, format: :json)
end
