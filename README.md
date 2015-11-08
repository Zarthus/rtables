# Ruby Tables
[![Build Status](https://travis-ci.org/Zarthus/rtables.svg?branch=master)](https://travis-ci.org/Zarthus/rtables)
[![Code Climate](https://codeclimate.com/github/Zarthus/rtables/badges/gpa.svg)](https://codeclimate.com/github/Zarthus/rtables)
[![Test Coverage](https://codeclimate.com/github/Zarthus/rtables/badges/coverage.svg)](https://codeclimate.com/github/Zarthus/rtables/coverage)

RTables (Ruby Tables) is a small library that helps you generate table output in various predefined formats.

## Installation

To install RTables, you can either `git clone` the GitHub repository, or simply run `gem install rtables`

## Example Code

```ruby
require 'rtables'

# Initialize the table you wish to use.
table = RTables::Table::PlainTable.new

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

## Picking the right table format

Tables are nice, but each table has their positive and negative things.

The [documentation](docs/tables) explains the cons and pros of each table.

## Support

There are two primary means of support.

- Leave an [issue](https://github.com/zarthus/rtables/issues/new) on the [GitHub Repository](https://github.com/zarthus/rtables)
- Alternatively, you may ask your question through IRC on [EsperNet in #zarthus](https://webchat.esper.net?channels=zarthus)

To allow us to help you, we suggest you seek out [the documentation](docs) and [contributing](CONTRIBUTING.md) files first.

## License

RTables is licensed under the [MIT license](LICENSE)
