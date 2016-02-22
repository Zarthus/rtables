require_relative '../spec_helper'

describe RTables::Table::MonoTable do
  it 'should match the length of our expectation based on a single column we inject' do
    table = RTables::Table::MonoTable.new

    column_name = '13 characters'
    row_content = 'row contents'
    expected_length = column_name.length + row_content.length + 7

    table.add_column(column_name)
    table.add_row(row_content)

    render = table.render
    render.each do |table_item|
      expect(table_item.length).to eq(expected_length)
    end
  end

  it 'may only include the separators and the content we provide' do
    table = RTables::Table::MonoTable.new

    table.add_column('a')
    table.add_column('aa')
    table.add_row('aaa', 'aaaaaa')
    table.add_row('aaaa', 'aaaaaaa')
    table.add_row('aaaaa', 'aaaaaa')

    render = table.render
    render.each do |table_item|
      expect(table_item).to match(/^[+\-\|a ]+$/)
    end
  end

  it 'should have the number of lines of our expectaction based on the values we inject' do
    table = RTables::Table::MonoTable.new

    table.add_column('test')
    table.add_row('test')
    table.add_row('test')
    table.add_row('test')

    expected_length = 7 # rows * 2 + 1 (to account for the separator)

    render = table.render
    expect(render.length).to eq(expected_length)
  end
end
