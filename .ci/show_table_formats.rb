# Sample script to display all table formats.

require_relative '../lib/rtables'

def populate_large_table(table)
  table.add_column('Name')
  table.add_column('Occupation')
  table.add_column('Voice Actor')

  table.add_row('Maxine Caulfield', 'Time Wizard', 'Serena de Mouroux')
  table.add_row('David N. Madsen', 'Head of Security at Blackwell Academy', 'Don McManus')
  table.add_row('Mark Jefferson', 'Professional Photographer, Teacher at Blackwell Academy', 'Derek Phillips')

  table
end

def populate_small_table(table)
  table.add_column('Key')
  table.add_column('Value')

  table.add_row('Date', Time.now.utc.to_s.split(' ').first)
  table.add_row('Time', Time.now.utc.to_s.split(' ')[1])
  table.add_row('Timezone', Time.now.utc.to_s.split(' ').last)

  table
end


tables = {
  'Plain Table' => RTables::Table::PlainTable,
  'Simple Table' => RTables::Table::SimpleTable,
  'Monospace Table' => RTables::Table::MonoTable,
  'Monospace Alternative Table' => RTables::Table::MonoTableAlt,
  'Unicode Monospace Table' => RTables::Table::UnicodeMonoTable,
  'Unicode Monospace Alternative Table' => RTables::Table::UnicodeMonoTableAlt
}

tables.each do |name, table|
  t1, t2 = table.new, table.new

  puts "Large: #{name}", populate_large_table(t1).to_s, "\n"
  puts "Small: #{name}", populate_small_table(t2).to_s, "\n\n"
end
