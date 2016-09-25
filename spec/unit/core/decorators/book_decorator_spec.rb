require 'spec_helper'
require './app/core/decorators/book_decorator'
require './app/core/models/book'

describe BookDecorator do

  let(:complete_book) { Book.new(title: 'title1',
                                 authors: ['Jack', 'John'],
                                 publisher: 'Book Brothers',
                                 subject: 'Shennaningans',
                                 isbn: '1234567890123')
  }

  let(:incomplete_book) { Book.new() }

  describe '.wrap' do
    it 'takes a collection and wraps all objects with this decorator' do
      wrapped = described_class.wrap([complete_book, incomplete_book])
      wrapped.each do |decorated|
        expect(decorated).to be_instance_of(described_class)
      end
    end
  end

  context 'when decorating a book with omissions' do
    subject { described_class.new(incomplete_book) }

    shared_examples 'replaces nil with N/A when calling' do |field|
      it "#{field}" do
        expect(subject.send(field)).to eq('N/A')
      end
    end

    it_behaves_like 'replaces nil with N/A when calling', :title
    it_behaves_like 'replaces nil with N/A when calling', :authors
    it_behaves_like 'replaces nil with N/A when calling', :publisher
    it_behaves_like 'replaces nil with N/A when calling', :subject
    it_behaves_like 'replaces nil with N/A when calling', :isbn
  end

  context 'when decorating a book with no omissions' do
    subject { described_class.new(complete_book) }

    shared_examples 'delegates the call to book when calling' do |field|
      it "#{field}" do
        expect(subject.send(field)).to eq(complete_book.send(field))
      end
    end

    it_behaves_like 'delegates the call to book when calling', :title
    it_behaves_like 'delegates the call to book when calling', :publisher
    it_behaves_like 'delegates the call to book when calling', :subject
    it_behaves_like 'delegates the call to book when calling', :isbn

    it 'returns a comma separated list of authors' do
      expect(subject.authors).to eq(complete_book.authors.join(', '))
    end
  end

end
