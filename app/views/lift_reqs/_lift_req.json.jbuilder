json.extract! lift_req, :id, :example_id, :created_at, :updated_at
json.url lift_req_url(lift_req, format: :json)
