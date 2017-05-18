json.extract! note, :id, :note, :author, :category, :timestamp, :hide_sticky, :created_at, :updated_at
json.url note_url(note, format: :json)