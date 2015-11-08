module RTables
  module Table
    class SimpleTable < TableBuilder
      def render
        raise_if_empty

        lines = []
        i = 0

        @table_content.each do |content|
          line = []
          @table_header.each do |header|
            line << "#{header}: #{content[i]}"
            i += 1
          end
          lines << line.join(', ')
          i = 0
        end

        lines
      end
    end
  end
end
