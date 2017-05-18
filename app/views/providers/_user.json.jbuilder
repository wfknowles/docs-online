json.extract! provider, :id, :name, :email, :desc, :created_at, :updated_at
json.url provider_url(provider, format: :json)
