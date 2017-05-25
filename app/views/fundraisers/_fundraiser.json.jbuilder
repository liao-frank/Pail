json.extract! fundraiser, :id, :owner_id, :type, :goal, :raised, :start_date, :end_date, :description, :created_at, :updated_at
json.url fundraiser_url(fundraiser, format: :json)
