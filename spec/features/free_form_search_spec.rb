require 'spec_helper'
require './app/cli/cli'

describe 'book search', :vcr do

  context 'User searches using a free form text' do

    let(:search_text) { 'Narnia' }

    it 'renders a list of books matching the search term' do
      result = CLI.run( [search_text] )
      expect(result).to eq(<<~EOS.chop)
        1: A Guide Through Narnia
        2: As Crônicas de Nárnia
        3: The Chronicles of Narnia
        4: Narnia - Full Musical
        5: Narnia Beckons
        6: Narnia and Beyond
        7: Revisiting Narnia
        8: Absolute Black
        9: Believing in Narnia
        10: Planet Narnia
      EOS
    end

  end

end
