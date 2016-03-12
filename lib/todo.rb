class TodoItem
  include Listable
  attr_reader :description, :due, :priority
  @@item_type = "todo"
  def item_type
    @@item_type
  end
  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    # TO REVIEWER: is there anything I can do to improve the following block? It looks too complex and bug-prone
    if !!@priority && @priority != ""
      raise UdaciListErrors::InvalidPriorityValue, "Invalid priority value" if !(["high", "medium", "low"].include? @priority)
    end
  end
  def details
    format_description(@description) +
    format_item_type(self.item_type)+
    "due: " + format_date(@due) +
    format_priority(@priority)
  end
end
