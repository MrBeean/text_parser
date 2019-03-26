require 'csv'

# Класс парсер текста, хранит элементы в hash @params
class TextParser
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def parse_text(files)
    files.each do |file|
      book_name = file.split('/').last.chomp('.txt')
      text = File.readlines(file, 'r:UTF-8')[0].split(/$|\./).map(&:strip).reject(&:empty?)
      chapter = text.shift(2)
      text.each_with_index do |sentence, index|
        dialog = DataManager.dialog?(sentence)
        data = []
        data << index + 1 << chapter[0] << chapter[1]
        data << dialog << sentence.size << sentence
        @params["#{book_name}_#{index + 1}".to_sym] = data
      end
    end
  end

  def save_to_csv(csv_file)
    CSV.open(csv_file, 'wb') do |csv|
      csv <<
        [
          'Номер предложения',
          'Номер главы',
          'Название главы',
          'Предложение диалог?',
          'Кол-во знаков',
          'Предложение'
        ]
      @params.each_value { |value| csv << value }
    end
  end
end
