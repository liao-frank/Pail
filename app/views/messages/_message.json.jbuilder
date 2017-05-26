json.extract! message, :id, :organization_id, :sender_id, :message_text, :likes, :date_time, :created_at, :updated_at
json.url message_url(message, format: :json)
