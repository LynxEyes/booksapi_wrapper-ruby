SearchQuery = Struct.new(:free_term, :limit) do
  def initialize(free_term: nil,
                 limit: 10)
    self.free_term = free_term
    self.limit = limit
  end
end
