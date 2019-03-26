module DataManager
  def self.create_csv(path)
    time = Time.now
    file_name = time.strftime('%Y%m%d_%H-%M')
    file = File.new(path + file_name + '.csv', 'w:UTF-8')
    file.close

    path + file_name + '.csv'
  end

  def self.dialog?(sentence)
    sentence[0] == '–' || sentence[0] == '-' ? true : false
  end

  def self.text_load(path)
    files_list = Dir.glob(path + '/*.txt')
    abort 'Нечего парсить! Добавьте файл.' if files_list.empty?
    files_list
  end

  def self.check_directory?(path)
    abort 'Отсутствует директория data/output' unless File.directory?(path + '/output')
    abort 'Отсутствует директория data/input' unless File.directory?(path + '/input')
    true
  end
end
