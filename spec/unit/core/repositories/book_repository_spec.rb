require 'spec_helper'
require './app/core/repositories/book_repository'
require './app/core/models/search_query'

describe BookRepository do

  let(:query) { SearchQuery.new('Narnia') }

  describe '#search', :vcr do
    it 'fetches a list of books matching the search query' do
      results = subject.search(query)
      expect(
        results.map(&:title)
      ).to include("The Chronicles of Narnia", "Revisiting Narnia")
    end

    it 'converts the API results into Book instances' do
      results = subject.search(query)
      expected_book = Book.new(
        title: 'A Guide Through Narnia',
        authors: ['Martha C. Sammons'],
        publisher: 'Regent College Publishing',
        subject: 'Literary Criticism',
        isbn: '9781573833080',
      )

      expect(results.first).to eq(expected_book)
    end
  end

end
