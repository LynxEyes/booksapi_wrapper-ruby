require 'spec_helper.rb'
require './app/core/services/book_service'
require './app/core/models/search_query'
require './app/core/models/book'
require './app/core/decorators/book_decorator'

describe BookService do
  let(:book1) { Book.new(title: 'title1') }
  let(:book2) { Book.new(title: 'title2') }
  let(:book_repository) { double('BookRepository', search: [book1, book2]) }

  subject{ described_class.new(book_repository) }

  describe '#search' do
    let(:query) { SearchQuery.new('Narnia') }

    it 'delegates the search on the book_repository' do
      expect(book_repository).to receive(:search).with(query)
      subject.search(query)
    end

    it 'returns a list of decorated books' do
      results = subject.search(query)

      results.each do |book|
        expect(book).to be_instance_of(BookDecorator)
      end
    end
  end

end
