module RTables
  class TableBuilder
    def initialize
      @table_header = []
      @table_content = []

      @columns = 0
      @rows = 0
    end

    attr_reader :table_header, :table_content, :columns, :rows

    def add_column(name)
      return false if column_exist?(name)
      fail TableFormatError, 'Cannot add more columns after rows have been added.' if @rows != 0

      @table_header.push(name)
      @columns += 1
      true
    end

    def add_row(*args)
      if args.count != @columns
        fail TableFormatError, "Number of arguments passed does not equal number of columns. [#{args.count} != #{@columns}]"
      end

      @table_content.push(args)
      @rows += 1
      true
    end

    def column_exist?(name)
      @table_header.include?(name)
    end

    def raise_if_empty
      fail TableFormatError, 'Table has no content to display.' if empty? || @columns == 0 || @rows == 0
    end

    def empty?
      @columns == 0 && @rows == 0
    end

    def render
      fail TableFormatError, 'This table does not generate any output.'
    end

    def to_s
      raise_if_empty

      lines = render

      lines.join("\n")
    end

    def inspect
      "<Table columns=#{@columns} rows=#{@rows}>"
    end
  end

  class TableFormatError < StandardError
  end
end
