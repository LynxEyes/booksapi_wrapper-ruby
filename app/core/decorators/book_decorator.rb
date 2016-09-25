class BookDecorator < SimpleDelegator

  def self.wrap(books)
    books.map(&self.method(:new))
  end

  EMPTY_RESPONSE = 'N/A'

  def title
    super || EMPTY_RESPONSE
  end

  def authors
    tmp_authors = super
    tmp_authors ? tmp_authors.join(', ') : EMPTY_RESPONSE
  end

  def publisher
    super || EMPTY_RESPONSE
  end

  def subject
    super || EMPTY_RESPONSE
  end

  def isbn
    super || EMPTY_RESPONSE
  end

end
