require_relative '../spec_helper'

describe RTables::Table::SimpleTable do
  it 'should match the length of our expectaction based on a single column we inject' do
    table = RTables::Table::SimpleTable.new

    column_name = '13 characters'
    row_content = 'row contents'
    expected_length = column_name.length + row_content.length + 2 # ': '

    table.add_column(column_name)
    table.add_row(row_content)

    render = table.render
    render.each do |table_item|
      expect(table_item.length).to eq(expected_length)
    end
  end

  it 'should match the format of \'column: value, secondcolumn: secondvalue\' with multiple rows' do
    table = RTables::Table::SimpleTable.new

    table.add_column('first column')
    table.add_column('second column')
    table.add_row('row content', 'more row content')
    table.add_row('row content 2', 'more row content 2')
    table.add_row('row content 3', 'more row content 3')

    render = table.render
    render.each do |table_item|
      expect(table_item).to match(/^[^:]+: [^,]+,[^:]+: more row content(?: \d)?$/)
    end
  end

  it 'should have the number of lines of our expectaction based on the values we inject' do
    table = RTables::Table::SimpleTable.new

    table.add_column('test')
    table.add_row('test')
    table.add_row('test')
    table.add_row('test')

    expected_length = 3 # rows added

    render = table.render
    expect(render.length).to eq(expected_length)
  end
end
