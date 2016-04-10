module RTables
  module Table
    class MonoTableAlt < TableBuilder
      def render
        corner = '+'
        line_horizontal = '-'
        line_vertical = '|'

        if @table_header.length > 4
          column_size = 160 / @table_header.length
        else
          column_size = 70 - (@table_header.length * 10)
        end

        table = []
        rowsep_item_tpl = "#{corner}#{((line_horizontal * (column_size - 2)) << corner) * @table_header.length}"
        rowsep_tpl = "#{corner}#{line_horizontal * (rowsep_item_tpl.length - 2)}#{corner}"
        item_tpl = "#{line_vertical} %s "

        table << rowsep_tpl

        item = ''
        @table_header.each do |col|
          item << pad(item_tpl % col, column_size - 3)
        end
        item << line_vertical
        table << item
        table << rowsep_item_tpl

        @table_content.each do |content|
          item = ''
          content.each do |col|
            item << pad(item_tpl % col, column_size - 3)
          end

          item << line_vertical
          table << item
        end

        table << rowsep_tpl

        # +-----------------------+
        # | row 1 | row 2 | row 3 |
        # |-------+-------+-------|
        # | smth  | smth2 | smth4 |
        # | smt   | kk    | ok    |
        # +-----------------------+

        table
      end

      def truncuate(s, len = 32, append = '..')
        trunc_len = len - append.length - 1

        return "#{s[0..trunc_len]}#{append}" if s.length > len
        s
      end

      def pad(s, len = 32, append = '..')
        s = truncuate(s, len, append)

        return s if s.length > len
        s << (' ' * (len - (s.length - 2)))
      end
    end
  end
end
