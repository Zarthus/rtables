# Unicode Monospace Table

Code:

```ruby
require 'rtables'
table = RTables::Table::UnicodeMonoTable.new

table.add_column('Example')
table.add_column('Field')
table.add_row('First', 'This is an example text')
table.add_row('Small', 'Field')
table.add_row('Very Large Field', 'With a large amount of text on it.')

table.render
```

Looks like (output from .ci/show_table_formats.rb):
```
┌─────────────┬─────────────────────────────────────────────────────────┐
│ Name        │ Maxine Caulfield                                        │
│ Occupation  │ Time Wizard                                             │
│ Voice Actor │ Serena de Mouroux                                       │
├─────────────┼─────────────────────────────────────────────────────────┤
│ Name        │ David N. Madsen                                         │
│ Occupation  │ Head of Security at Blackwell Academy                   │
│ Voice Actor │ Don McManus                                             │
├─────────────┼─────────────────────────────────────────────────────────┤
│ Name        │ Mark Jefferson                                          │
│ Occupation  │ Professional Photographer, Teacher at Blackwell Academy │
│ Voice Actor │ Derek Phillips                                          │
└─────────────┴─────────────────────────────────────────────────────────┘
```

## Positives

- Easy to read
- Perfect for key => value display

## Negatives

- Requires a Monospace font to render properly.
- Will not function when charset is misconfigured, does not use basic ASCII characters.
