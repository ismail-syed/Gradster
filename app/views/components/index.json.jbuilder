json.array!(@components) do |component|
  json.extract! component, :id, :name, :component_weight
  json.url component_url(component, format: :json)
end
