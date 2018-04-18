json.extract! stat, :id, :example_id, :likes, :avg_rating, :impressions, :clicks, :code_views, :created_at, :updated_at
json.url stat_url(stat, format: :json)
