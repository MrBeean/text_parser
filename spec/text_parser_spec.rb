require_relative '../lib/text_parser'

RSpec.describe 'TextParser' do
  it 'parses tex' do
    expect('ок').to eql('ок')
  end
end
