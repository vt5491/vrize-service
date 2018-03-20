class ExampleLiftReq < ApplicationRecord
  # belongs_to :examples
  belongs_to :example
  # has_many :group_users, :class_name => 'GroupUser'
  # has_one :foo_bar_store, class_name: "Store"
end
