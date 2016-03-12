class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    raise UdaciListErrors::InvalidItemType, "Invalid item type" if !["todo", "event", "link"].include? type
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize, "Index exceeds list size" if index > @items.count
    @items.delete_at(index - 1)
  end
  def all
    table = Terminal::Table.new :title => @title
    @items.each_with_index do |item, position|
      row = [ "#{position + 1}" ]+item.details
      table << row
    end
    puts table
  end
  def filter(item_type)
    table = Terminal::Table.new :title => @title +" - "+ item_type + "'s"
    filtered_list = @items.select{|item| item.item_type == item_type}
    if filtered_list.count > 0
      filtered_list.each_with_index do |item, position|
        row = ["#{position + 1}"]+ item.details
        table << row
      end
    else
      table << ["There are no items in the list"]
    end
    puts table
  end
end