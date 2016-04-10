# Monospace Table

Code:

```ruby
require 'rtables'
table = RTables::Table::UnicodeMonoTableAlt.new

table.add_column('Example')
table.add_column('Field')
table.add_row('First', 'This is an example text')
table.add_row('Small', 'Field')
table.add_row('Very Large Field', 'With a large amount of text on it.')

table.render
```

Looks like (output from .ci/show_table_formats.rb):
```
┌──────────────────────────────────────┬──────────────────────────────────────┬──────────────────────────────────────┐
│ Name                                 │ Occupation                           │ Voice Actor                          │
├──────────────────────────────────────┼──────────────────────────────────────┼──────────────────────────────────────┤
│ Maxine Caulfield                     │ Time Wizard                          │ Serena de Mouroux                    │
│ David N. Madsen                      │ Head of Security at Blackwell Aca..  │ Don McManus                          │
│ Mark Jefferson                       │ Professional Photographer, Teache..  │ Derek Phillips                       │
└──────────────────────────────────────┴──────────────────────────────────────┴──────────────────────────────────────┘
```

## Positives

- Easy to read
- Good for displaying two or three rows
- Good for displaying a lot of data.

## Negatives

- Requires a Monospace font to render properly.
- Will not function when charset is misconfigured, does not use basic ASCII characters.
- Truncates lengthy data
