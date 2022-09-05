json.extract! flipbook, :id, :title, :subtitle, :description, :thumbnail, :url, :created_at, :updated_at
json.url flipbook_url(flipbook, format: :json)
