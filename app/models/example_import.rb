# class ExampleImport < ApplicationRecord
class ExampleImport
  require 'pp'
  require 'example_extractor'

  attr_accessor :examples

  def initialize
    # @file_info_hash = []
    @examples = []
  end

  def extract
    p "ExampleImport.extract: entered"
    xtor = ExampleExtractor.new

    @examples = xtor.extract_examples_main(:dir => "/home/vturner/vtstuff/github/three.js/examples")

    p "results:"
    xtor.file_info_hash[0..5].each { |f|
      pp f
    }
    #
    # @examples[0] = {:abc => 7, :def => 8}
    # @examples[1] = {:abc => 17, :def => 17}
  end
end
