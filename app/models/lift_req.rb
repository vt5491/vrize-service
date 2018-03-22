class LiftReq < ApplicationRecord
  belongs_to :example

  # attr_accessor :name, :abc
  # attr_accessor :abc

  # def attributes
  #   super.merge({'name' => name, 'lifted' => example.lifted})
  # end
  # def attributes
  #   super.merge({'abc' => abc})
  # end

  # def unfinished_items
  #   self.items.where("status = ?", false)
  # end
  # def name
  #   # self.lift_req.where("status = ?", false)
  #   p "LiftReq.name: self=#{self}, self.example=#{self.example}"
  #   self.example.name
  # end
end
