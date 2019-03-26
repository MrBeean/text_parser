require_relative 'lib/text_parser'
require_relative 'lib/text_parser/data_manager'

csv_file = DataManager.create_csv('data/output/')

data = TextParser.load_text('data/input/')
data.to_csv(csv_file)

puts "CSV файл сформирован и распологается тут: #{csv_file}"