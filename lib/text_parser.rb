require 'csv'

class TextParser
  attr_reader :data

  def initialize(params)
    @params = params
  end

  def self.load_text(path)
    params = {}
    files_list = Dir.glob(path + '*.txt')
    abort 'Нечего парсить!' if files_list.size == 0
    files_list.each do |file|
      book_name = file.split('/').last.chomp('.txt')
      text = File.readlines(file, "r:UTF-8")[0].split(/$|\./).map(&:strip).reject(&:empty?)
      chapter = text.shift(2)
      text.each_with_index do |sentence, index|
        dialog = DataManager.dialog?(sentence)
        data = []
        data << index + 1 << chapter[0] << chapter[1] << dialog << sentence.size << sentence
        params["#{book_name}_#{index + 1}".to_sym] = data
      end
    end

    self.new(params)
  end

  def to_csv(csv_file)
    CSV.open(csv_file, "wb") do |csv|
      csv << ['Номер предложения', 'Номер главы', 'Название главы', 'Предложение диалог?', 'Кол-во знаков', 'Предложение']
      @params.each_value { |value| csv << value }
    end
  end
end
