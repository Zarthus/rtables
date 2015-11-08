require_relative 'spec_helper'

describe RTables::TableBuilder do
  it 'should add a column when add_column is called' do
    table = RTables::TableBuilder.new

    table.add_column('a')

    expect(table.columns).to eq(1)
    expect(table.table_header.count).to eq(1)
  end

  it 'should add a row when add_row is called' do
    table = RTables::TableBuilder.new

    table.add_column('a')
    table.add_row('a')

    expect(table.rows).to eq(1)
    expect(table.table_content.count).to eq(1)
  end

  it 'should raise a TableFormatError when the given row parameters is not equal to the number of columns' do
    table = RTables::TableBuilder.new

    table.add_column('a')
    table.add_column('b')
    table.add_column('c')

    expect { table.add_row('a') }.to raise_error(RTables::TableFormatError)
  end

  it 'should raise a TableFormatError when adding a new column when we have already added some rows' do
    table = RTables::TableBuilder.new

    table.add_column('b')
    table.add_row('a')

    expect { table.add_column('c') }.to raise_error(RTables::TableFormatError)
  end

  it 'should raise a TableFormatError when adding a new row and there are no columns' do
    table = RTables::TableBuilder.new

    expect { table.add_row('a') }.to raise_error(RTables::TableFormatError)
  end

  it 'should raise a TableFormatError when render is called' do
    table = RTables::TableBuilder.new

    expect { table.render }.to raise_error(RTables::TableFormatError)
  end

  it 'should raise a TableFormatError when raise_if_empty is called and there is no content' do
    table = RTables::TableBuilder.new

    expect { table.raise_if_empty }.to raise_error(RTables::TableFormatError)
  end

  it 'should return the correct boolean value when calling empty?' do
    table = RTables::TableBuilder.new

    expect(table.empty?).to eq(true)

    table.add_column('table')

    expect(table.empty?).to eq(false)
  end
end
