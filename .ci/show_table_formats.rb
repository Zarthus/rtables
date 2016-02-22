# Sample script to display all table formats.

require_relative '../lib/rtables'

def populate_table(table)
  table.add_column('Name')
  table.add_column('Occupation')
  table.add_column('Voice Actor')

  table.add_row('Maxine Caulfield', 'Time Wizard', 'Serena de Mouroux')
  table.add_row('David N. Madsen', 'Head of Security at Blackwell Academy', 'Don McManus')
  table.add_row('Mark Jefferson', 'Professional Photographer, Teacher at Blackwell Academy', 'Derek Phillips')

  table
end

tables = {
  'Plain Table' => RTables::Table::PlainTable.new,
  'Simple Table' => RTables::Table::SimpleTable.new,
  'Monospace Table' => RTables::Table::MonoTable.new,
  'Monospace Alternative Table' => RTables::Table::MonoTableAlt.new,
  'Unicode Monospace Table' => RTables::Table::UnicodeMonoTable.new
}

tables.each do |name, table|
  puts name, populate_table(table).to_s, "\n"
end
