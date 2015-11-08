module RTables
  module Table
    class PlainTable < TableBuilder
      def render
        raise_if_empty

        lines = []
        i = 0

        @table_content.each do |content|
          @table_header.each do |header|
            lines << "#{header}: #{content[i]}"
            i += 1
          end
          lines << '----'
          i = 0
        end

        lines
      end
    end
  end
end
