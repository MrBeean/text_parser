module DataManager
  def self.create_csv(path)
    time = Time.now
    file_name = time.strftime("%Y%m%d %H-%M-%S")
    file = File.new(path + file_name + ".csv", "w:UTF-8")
    file.close

    path + file_name + ".csv"
  end

  def self.dialog?(sentence)
    sentence[0] == '–' || sentence[0] == '-' ? true : false
  end
end