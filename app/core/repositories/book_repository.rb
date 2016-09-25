require 'open-uri'
require 'json'
require './app/core/models/book'

class BookRepository

  API_BASE_URI = 'https://www.googleapis.com/books/v1/volumes?q='

  def search(query)
    data = URI(search_url(query)).read
    json_data = JSON.parse(data)

    json_data['items'].map(&method(:parse_item_to_book))
  end

  private

  def search_url(query)
    API_BASE_URI + query.free_term
  end

  def parse_item_to_book(item)
    volume = item['volumeInfo']
    Book.new(title: volume['title'],
             authors: volume['authors'],
             publisher: volume['publisher'],
             subject: find_subject(volume),
             isbn: find_isbn(volume))
  end

  def find_subject(volume)
    Array(volume['categories']).join(', ')
  end

  def find_isbn(volume)
    identifiers = Array(volume['industryIdentifiers'])

    ['ISBN_13', 'ISBN_10'].map { |type|
      identifiers.find { |i| i['type'] == type }
    }.compact
     .map { |isbn|
       isbn['identifier']
    }.first
  end

end
