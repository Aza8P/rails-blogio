json.extract! article, :id, :title, :content, :is_public, :published_at, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
