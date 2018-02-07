# require 'json'

class ExamplesImportController < ApplicationController

  # GET /examples
  # GET /examples.json
  def index
    # @examples = Example.all
    p "ExamplesImportController.index: entered"
    # Example.do_it
    @example = Example.new
    @example.do_it
  end

  # POST /examplesImport
  # POST /examplesImport.json
  def create
    p "ExamplesImportController.create: entered"
    @exampleImport = ExampleImport.new

    @exampleImport.extract

    Rails.cache.fetch('import_examples') do
      @exampleImport.examples.to_json
    end
  end

  def write
    p "ExamplesImportController.write: entered"
    @exampleImport = ExampleImport.new
    json = Rails.cache.fetch('import_examples')
    # p "write: json=#{json}"

    # a = JSON.parse json
    # p "write: a=#{a}"

    # p "write: pre exampleImport.examples.length=#{@exampleImport.examples.length}"
    # @exampleImport.examples = a
    # @exampleImport.examples = [{abc: 7}]
    @exampleImport.examples = JSON.parse json
    p "write: exampleImport.examples.length=#{@exampleImport.examples.length}"

    # @exampleImport.examples[0..3].each { |ex_import|
    @exampleImport.examples.each { |ex_import|
      prior = Example.find_by(name: ex_import['name'])
      # p "ex_import=#{ex_import}"
      # p "name=#{ex_import['name']}, category=#{ex_import['category']}"
      if (!prior)
        example = Example.create(
          name: ex_import['name'],
          category: ex_import['category'],
          keyword_1: ex_import['keyword_1'],
          keyword_2: ex_import['keyword_2'],
        )

      else
        p "found dup for#{ex_import['name']}"
      end

    }
  end


end
