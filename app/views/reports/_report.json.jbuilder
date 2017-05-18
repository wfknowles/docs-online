json.extract! report, :id, :name, :creator, :type,:representation,:filter_field,:operator,:first_val,:second_val ,:created_at, :updated_at
json.url report_url(report, format: :json)
