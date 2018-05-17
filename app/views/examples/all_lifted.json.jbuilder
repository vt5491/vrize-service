# json.extract! @examples, :id, :name
# json.examples @example.name, :category, :created_at
# json.examples  do |example|
#   example.name
# end
# works
# json.examples @examples do |example|
#   json.example example.name
# end
# json.examples @examples do |example|
#   json.example example.name
#   json.example example.category
# end
# json.extract! examples, :id, :name, :category
json.examples @examples do |example|
  #works
  # json.extract! example, :id, :name, :category, :tags
  json.extract! example, :id, :name, :category
  # json.extract! example.tags, :tag
  json.tags example.tags do |tag|
    json.extract! tag, :tag
  end
end
