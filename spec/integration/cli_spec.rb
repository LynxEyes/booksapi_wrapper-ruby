require 'spec_helper'
require './app/cli/cli'

describe CLI, :vcr do

  context 'when searching for some non-existing term' do
    it 'returns a no results found message' do
      results = CLI.run(['asdasdasdasdasdasdasdasdasd'])
      expect(results).to eq("No results found")
    end
  end

  context 'returns an error message' do
    it 'when requesting more results than 40 results' do
      results = CLI.run(['-l', '50'])
      expect(results).to eq("Error: Maximum results is 40")
    end

    shared_examples 'fails for numbers lower than 1 like' do |number|
      it number do
        results = CLI.run(['-l', number.to_s])
        expect(results).to eq("Error: Number of results must be greater than 0")
      end
    end

    it_behaves_like 'fails for numbers lower than 1 like', 0
    it_behaves_like 'fails for numbers lower than 1 like', -1
  end

end
