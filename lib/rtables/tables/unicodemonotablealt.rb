module RTables
  module Table
    class UnicodeMonoTableAlt < TableBuilder
      CORNER_POS_LTOP = '┌'
      CORNER_POS_RTOP = '┐'
      CORNER_POS_MTOP = '┬'

      CORNER_POS_LMID = '├'
      CORNER_POS_RMID = '┤'
      CORNER_POS_MMID = '┼'

      CORNER_POS_LBOT = '└'
      CORNER_POS_RBOT = '┘'
      CORNER_POS_MBOT = '┴'

      def render
        line_horizontal = '─'
        line_vertical = '│'

        if @table_header.length > 4
          column_size = 160 / @table_header.length
        else
          column_size = 70 - (@table_header.length * 10)
        end

        row_sep_base = "#{(line_horizontal * (column_size - 2))}%{tchar}" * (@table_header.length)

        # This needs to be smaller because without, we get one character added too many.
        row_sep_base_small = row_sep_base[0..row_sep_base.length - 9]
        row_sep_top = "#{CORNER_POS_LTOP}#{row_sep_base_small % { tchar: CORNER_POS_MTOP }}#{CORNER_POS_RTOP}"
        row_sep_mid = "#{CORNER_POS_LMID}#{row_sep_base_small % { tchar: CORNER_POS_MMID }}#{CORNER_POS_RMID}"
        row_sep_bot = "#{CORNER_POS_LBOT}#{row_sep_base_small % { tchar: CORNER_POS_MBOT }}#{CORNER_POS_RBOT}"

        item_fmt = "#{line_vertical} %s"
        table = []

        table << row_sep_top

        item = ''
        @table_header.each do |col|
          item << pad(item_fmt % col, column_size - 3)
        end
        item << line_vertical
        table << item
        table << row_sep_mid

        @table_content.each do |contents|
          item = ''

          contents.each do |col|
            item << pad(item_fmt % col, column_size - 3)
          end

          item << line_vertical
          table << item
        end

        table << row_sep_bot

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
