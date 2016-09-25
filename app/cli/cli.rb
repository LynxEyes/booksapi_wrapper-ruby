require 'optparse'
require './app/core/models/search_query'
require './app/core/services/book_service'

class CLI

  def self.run(argv)
    new.run(argv)
  end

  attr_reader :book_service
  attr_reader :query_validation_errors

  def initialize(book_service = BookService.new)
    @book_service = book_service
    @query_validation_errors = []
  end

  def run(argv)
    query = parse_arguments(argv)

    if valid(query)
      results = book_service.search(query)

      respond_with(results)
    else
      respond_with_validation_errors
    end
  end

  private

  def respond_with(results)
    return "No results found" if results.empty?

    results.each_with_index
           .map { |book, idx| "#{idx+1}: #{book.title}" }
           .join("\n")
  end

  def respond_with_validation_errors
    query_validation_errors.join("\n")
  end

  def parse_arguments(argv)
    query = SearchQuery.new

    OptionParser.new do |opts|
      opts.banner = "Usage: bookapp [options]"

      opts.on("-l LIMIT", "--limit=LIMIT", "Run verbosely") do |v|
        query.limit = v.to_i
      end
    end.parse!(argv)

    query.free_term = argv.join(" ")

    query
  end

  def valid(query)
    query_validation_errors << "Error: Maximum results is 40" if query.limit > 40
    query_validation_errors << "Error: Number of results must be greater than 0" if query.limit < 1

    query_validation_errors.empty?
  end
end
