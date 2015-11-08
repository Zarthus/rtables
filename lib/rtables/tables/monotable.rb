module RTables
  module Table
    class MonoTable < TableBuilder
      def render
        corner = '+'
        line_horizontal = '-'
        line_vertical = '|'

        hlen = max_header_length
        clen = max_content_length

        row_sep = "#{corner}#{line_horizontal * (hlen + 2)}#{corner}#{line_horizontal * (clen + 2)}#{corner}"
        line_fmt = "#{line_vertical} %{header} #{line_vertical} %{content} #{line_vertical}"
        lines = []
        i = 0

        lines << row_sep
        @table_content.each do |contents|
          contents.each do |content|
            lines << line_fmt % { header: pad_header(@table_header[i], hlen), content: pad_content(content, clen) }
            i += 1
          end

          i = 0
          lines << row_sep
        end

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
