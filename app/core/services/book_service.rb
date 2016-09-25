require './app/core/repositories/book_repository'
require './app/core/decorators/book_decorator'

class BookService

  attr_reader :book_repository

  def initialize(book_repository = BookRepository.new)
    @book_repository = book_repository
  end

  def search(query)
    books = book_repository.search(query)
    BookDecorator.wrap(books)
  end

end
