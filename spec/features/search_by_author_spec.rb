require 'spec_helper'
require './app/cli/cli'

describe 'book search', :vcr do

  context 'User filters by author' do

    let(:author) { 'Tolkien' }

    it 'renders a list of books from Tolkien' do
      result = CLI.run( ['-a', 'Tolkien'] )
      expect(result).to eq(<<~EOS.chop)
        1: OS FILHOS DE HURIN
        2: O Silmarillion
        3: O Hobbit
        4: Catalogue of an exhibition of drawings by J. R. R. Tolkien
        5: The War of the Ring
        6: THE FELLOWSHIP OF THE RING
        7: The Hobbit (Enhanced Edition)
        8: The World of Hobbits
        9: The History of Middle-Earth Index
        10: Senhor Dos Aneis, O - as Duas Torres - Vol 2
      EOS
    end

    it 'searches for a term while filtering by author' do
      result = CLI.run( ['-a', 'Tolkien', 'silmarillion'] )
      expect(result).to eq(<<~EOS.chop)
        1: The Silmarillion
        2: O Silmarillion
        3: The Silmarillion
        4: THE SILMARILLION GIFT PACK
        5: The War of the Jewels
        6: Tolkien and the Silmarils
        7: The Complete Guide to Middle-earth
        8: Il Silmarillion
        9: The Book of Lost Tales, Part One
        10: El Silmarillion
      EOS
    end

  end

end
