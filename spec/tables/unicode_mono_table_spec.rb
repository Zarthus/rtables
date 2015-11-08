require_relative '../spec_helper'

describe RTables::Table::UnicodeMonoTable do
  it 'should match the length of our expectaction based on the values we inject' do
    table = RTables::Table::UnicodeMonoTable.new

    column_name = '13 characters'
    row_content = 'row contents'
    padding_per_column = 3 # two spaces and one delimiter
    expected_length = column_name.length + row_content.length + (padding_per_column * 2) + 1

    table.add_column(column_name)
    table.add_row(row_content)

    render = table.render

    render.each do |table_item|
      expect(table_item.length).to eq(expected_length)
    end
  end

  it 'should have the number of lines of our expectaction based on the values we inject' do
    table = RTables::Table::UnicodeMonoTable.new

    table.add_column('test')
    table.add_row('test')
    table.add_row('test')
    table.add_row('test')

    expected_length = 3 + 4 # rows + separators

    render = table.render
    expect(render.length).to eq(expected_length)
  end
end
