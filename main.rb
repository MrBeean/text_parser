require_relative 'lib/text_parser'
require_relative 'lib/text_parser/data_manager'

current_dir = Dir.pwd
DataManager.check_directory?(current_dir + '/data')
csv_file = DataManager.create_csv(current_dir + '/data/output/')
files = DataManager.text_load(current_dir + '/data/input')
parser = TextParser.new
parser.parse_text(files)
parser.save_to_csv(csv_file)

puts "CSV файл сформирован и распологается тут: #{csv_file}"