module RTables
  module Table
    class UnicodeMonoTable < TableBuilder
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

        hlen = max_header_length
        clen = max_content_length

        row_sep_base = "#{line_horizontal * (hlen + 2)}%{tchar}#{line_horizontal * (clen + 2)}"
        row_sep_top = "#{CORNER_POS_LTOP}#{row_sep_base % { tchar: CORNER_POS_MTOP }}#{CORNER_POS_RTOP}"
        row_sep_mid = "#{CORNER_POS_LMID}#{row_sep_base % { tchar: CORNER_POS_MMID }}#{CORNER_POS_RMID}"
        row_sep_bot = "#{CORNER_POS_LBOT}#{row_sep_base % { tchar: CORNER_POS_MBOT }}#{CORNER_POS_RBOT}"

        line_fmt = "#{line_vertical} %{header} #{line_vertical} %{content} #{line_vertical}"
        lines = []
        i = 0

        lines << row_sep_top
        @table_content.each do |contents|
          contents.each do |content|
            lines << line_fmt % { header: pad_header(@table_header[i], hlen), content: pad_content(content, clen) }
            i += 1
          end

          i = 0
          lines << row_sep_mid
        end
        lines.pop
        lines << row_sep_bot

        lines
      end

      def pad_header(header, hlen)
        spacing = hlen - header.length

        header + (' ' * spacing)
      end

      def pad_content(content, clen)
        spacing = clen - content.length

        content + (' ' * spacing)
      end

      def max_content_length
        max_len = 0

        @table_content.each do |contents|
          contents.each do |content|
            len = content.length
            max_len = len if max_len < len
          end
        end

        max_len
      end

      def max_header_length
        max_len = 0

        @table_header.each do |head|
          len = head.length
          max_len = len if max_len < len
        end

        max_len
      end
    end
  end
end
