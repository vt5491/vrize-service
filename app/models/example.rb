require 'pp'
require 'example_extractor'

class Example < ApplicationRecord
  # require '../services/example_extractor'
  # load 'example_extractor'
  # attr_accessor :name
  # attr_accessor :category

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
end
