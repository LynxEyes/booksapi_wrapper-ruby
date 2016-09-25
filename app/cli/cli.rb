require './app/core/models/search_query'
require './app/core/services/book_service'

class CLI

  def self.run(argv)
    new.run(argv)
  end

  attr_reader :book_service

  def initialize(book_service = BookService.new)
    @book_service = book_service
  end

  def run(argv)
    query = SearchQuery.new(argv[0])

    results = book_service.search(query)

    results.each_with_index
           .map { |book, idx| "#{idx+1}: #{book.title}" }
           .join("\n")
  end

end
