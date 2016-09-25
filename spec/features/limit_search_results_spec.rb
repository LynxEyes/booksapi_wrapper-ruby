require 'spec_helper'
require './app/cli/cli'

describe 'book search', :vcr do

  context 'User limits the number of responses' do

    let(:search_text) { 'Narnia' }

    it 'renders a list of books matching the search term' do
      result = CLI.run( ['-l', '3', search_text] )
      expect(result).to eq(<<~EOS.chop)
        1: A Guide Through Narnia
        2: As Crônicas de Nárnia
        3: The Chronicles of Narnia
      EOS
    end

  end

end
