# Plain Table

Code:

```ruby
require 'rtables'
table = RTables::Table::PlainTable.new

table.add_column('Example')
table.add_column('Field')
table.add_row('First', 'This is an example text')
table.add_row('Small', 'Field')
table.add_row('Very Large Field', 'With a large amount of text on it.')

table.render
```

Looks like (output from .ci/show_table_formats.rb):
```
Name: Maxine Caulfield
Occupation: Time Wizard
Voice Actor: Serena de Mouroux
----
Name: David N. Madsen
Occupation: Head of Security at Blackwell Academy
Voice Actor: Don McManus
----
Name: Mark Jefferson
Occupation: Professional Photographer, Teacher at Blackwell Academy
Voice Actor: Derek Phillips
----
```

## Positives

- Displays the same everywhere
