require 'pp'
require 'example_extractor'

class Example < ApplicationRecord
  # has_many :example_lift_reqs, dependent: :destroy
  # has_many :example_lift_reqs, :class_name => 'ExampleLiftReq'
  has_many :lift_reqs, :class_name => 'LiftReq'
  has_one :stat, :class_name => 'Stat'
  has_many :tags, :class_name => 'Tag'

  # accepts_nested_attributes_for :lift_reqs, :stat
  # require '../services/example_extractor'
  # load 'example_extractor'
  # attr_accessor :name
  # attr_accessor :category
  # attr_accessor :keyword_1
  # attr_accessor :keyword_2
  # attr_accessor :lifted

  def do_it
    p "Example.do_it: entered"
    7
  end

  def do_something
    xtor = ExampleExtractor.new
    xtor.do_it
  end

  def extract
    p "Example.extract: entered"
    xtor = ExampleExtractor.new

    result = xtor.extract_examples_main(:dir => "/home/vturner/vtstuff/github/three.js/examples")

    p "results:"
    xtor.file_info_hash[0..5].each { |f|
      pp f
    }
  end

  # def update(params)
  #   # p "Example: now in update, params.lifted= #{params.lifted}, self.lifted=#{self.lifted}"
  #   # p "Example: now in update, params.lifted= #{params.lifted}"
  #   p "Example: now in update, params= #{params}"
  #   # example = Example.find_by(id: example.id)
  #   # example.lifted =
  #   self.save
  # end

end
