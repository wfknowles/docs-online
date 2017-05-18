json.extract! document, :id, :name, :creator, :type, :created_at, :updated_at
json.url document_url(document, format: :json)
