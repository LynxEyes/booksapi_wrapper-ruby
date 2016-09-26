SearchQuery = Struct.new(:free_term, :limit, :author) do
  def initialize(free_term: nil,
                 limit: 10,
                 author: nil)
    self.free_term = free_term
    self.limit = limit
    self.author = author
  end
end
