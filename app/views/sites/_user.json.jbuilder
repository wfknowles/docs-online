json.extract! site, :id, :name, :email, :desc, :created_at, :updated_at
json.url site_url(site, format: :json)
