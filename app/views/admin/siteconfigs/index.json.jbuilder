json.array!(@siteconfigs) do |siteconfig|
  json.extract! siteconfig, :id, :name, :value
  json.url siteconfig_url(siteconfig, format: :json)
end
