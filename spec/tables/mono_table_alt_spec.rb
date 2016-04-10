require_relative '../spec_helper'

describe RTables::Table::MonoTableAlt do
  it 'should dynamically determine how much space one table can have (small amount of columns)' do
    table = RTables::Table::MonoTableAlt.new

    table.add_column('foo')
    table.add_column('bar')
    table.add_column('baz')

    table.add_row('foo', 'bar', 'baz')

    render = table.render
    render.each do |table_item|
      expect(table_item.length).to be > 100
    end
  end

  it 'should always have the same table length for each row' do
    table = RTables::Table::MonoTableAlt.new

    table.add_column('foo')
    table.add_column('bar')
    table.add_column('baz')

    table.add_row('foo', 'bar', 'baz')
    table.add_row('doo', 'dar', 'daz')

    render = table.render
    table_size = render[0].length

    render.each do |table_item|
      expect(table_item.length).to eq(table_size)
    end
  end

  it 'should always have the same table length for each row when column sizes differ in size' do
    table = RTables::Table::MonoTableAlt.new

    table.add_column('xyz')
    table.add_column('QwertyUiop')
    table.add_column('Book Title and Author')

    table.add_row('Something', 'Some other data', 'hello world')
    table.add_row('Ok', 'small', '1')
    table.add_row('Longer Data', 'Even longer data', 'The longest of datas of all!')

    render = table.render
    table_size = render[0].length

    render.each do |table_item|
      expect(table_item.length).to eq(table_size)
    end
  end

  it 'should truncate long strings' do
    table = RTables::Table::MonoTableAlt.new

    table.add_column('An extremely, unnecessarily, unimaginably long table column name.')
    table.add_row('Similarily, we are going to do the same for the table row content!')

    render = table.render
    tbl_matches = 0

    render.each do |table_item|
      tbl_matches += 1 if table_item =~ /\.\./
    end

    expect(tbl_matches).to eq(2)
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
