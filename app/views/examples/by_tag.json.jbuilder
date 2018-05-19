json.examples @examples do |example|
  json.extract! example, :id, :example_id, :name, :lift_score, :tag
  # json.extract! example.tags[0], :tag
  # json.tags example.tags do |tag|
  #   json.extract! tag, :tag
  # end
end
