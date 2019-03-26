require_relative '../lib/text_parser'
require_relative '../lib/text_parser/data_manager'

RSpec.describe TextParser do
  let(:parser) { TextParser.new }
  let(:current_dir) { Dir.pwd }

  it 'parses text' do
    files = Dir.glob(current_dir + '/spec/fixtures/*.txt')
    parser.parse_text(files)
    expect(parser.params[:kaynozoy_1].last).to eql('Вагон-ресторан был древний')
  end

  it 'saves data to csv' do

  end
end
