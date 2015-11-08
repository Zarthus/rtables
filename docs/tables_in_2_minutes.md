# Building a table

A table exists of two components. Columns, and rows.

In your source code, you will define the columns before adding any rows.

Given the following example:
```ruby
require 'rtables'

# Initialize the table you wish to use.
table = RTables::Table::TableName.new

# Add the table headers to the table. This will structure our table.
table.add_column('Example')
table.add_column('Second Column')

# Start adding rows to the table.
# For each column you have added, you need to pass another parameter.
table.add_row('Hello', 'World!')
table.add_row('Another day', 'Another row!')
table.add_row('It\'s a beautiful day to be a table', 'Indeed.')

# The final step, we either .render or .to_s our table.
#  .render returns a line-separated array,
#  .to_s calls render.join("\n").
puts table.to_s
```

You can run `ruby .ci/show_table_formats.rb` to generate a current list of table formats.

## Making your own table
Your table needs to meet the following two conditions:

- Extend `RTables::TableBuilder`
- Have a `render` method that returns an array of lines.
  - May call `raise_if_empty` in `render` to generate a `TableFormatError` when there is no content.

### Base code

```ruby
require 'rtables/tablebuilder'

class MyTable < RTables::TableBuilder
  def render
    raise_if_empty

    # Logic that returns an array of lines ..
  end
end
