Book = Struct.new(:title, :authors, :publisher, :subject, :isbn) do
  def initialize(title: nil,
                 authors: nil,
                 publisher: nil,
                 subject: nil,
                 isbn: nil)
    self.title = title
    self.authors = authors
    self.publisher = publisher
    self.subject = subject
    self.isbn = isbn
  end
end
