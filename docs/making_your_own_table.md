# Making your own table

Making your own table is very easy.

Your table needs to meet the following two conditions:

- Extend `RTables::TableBuilder`
- Have a `render` method that returns an array of lines.
  - May call `raise_if_empty` in `render` to generate a `TableFormatError` when there is no content.

Tables can make use of the following data included from `RTables::TableBuilder`:

- `@columns` and `@rows` integer values with the number of columns and rows.
- `@table_header` - an array of all columns.
- `@table_content` - a list of arrays with table content.

Refer to any of the existing tables for guidance on how you could use this to your benefit.

## What it should roughly look like

```ruby
require 'rtables/tablebuilder'

class MyTable < RTables::TableBuilder
  def render
    raise_if_empty

    lines = []
    i = 0

    @table_content.each do |content|
      line = []
      @table_header.each do |header|
        line << "#{header}: #{content[i]}"
        i += 1
      end
      lines << line.join(', ')
      i = 0
    end

    lines
  end
end

# Elsewhere, where you need the table.
table = MyTable.new

table.add_column('First Name')
table.add_column('Last Name')

table.add_row('Max', 'Caulfield')
table.add_row('Chloe', 'Price')

puts table.to_s
```

Output:
```
First Name: Max, Last Name: Caulfield
First Name: Chloe, Last Name: Price
```
