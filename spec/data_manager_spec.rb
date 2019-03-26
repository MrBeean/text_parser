require_relative '../lib/text_parser/data_manager'

RSpec.describe DataManager do
  let(:current_dir) { Dir.pwd }

  it 'creates csv file' do
    expected_name = current_dir + '/spec/fixtures/' + Time.now.strftime('%Y%m%d_%H-%M') + '.csv'
    expect(DataManager.create_csv(current_dir + '/spec/fixtures/')).to eql(expected_name)
  end

  it 'finds dialog' do
    expect(DataManager.dialog?('- Это точно диалог!, - сказал он')).to be true
  end

  it 'loads text' do
    file_list = current_dir + '/spec/fixtures/kaynozoy.txt'
    expect(DataManager.text_load(current_dir + '/spec/fixtures')[0]).to eql(file_list)
  end
end
