
module Listable
  def format_description(description)
    "#{description}".ljust(25)
  end
  def format_item_type(item_type)
    "#{item_type}".ljust(7)
  end
  def format_date(*dates_list)
    dates = dates_list[0].strftime("%D") if dates_list[0]
    dates << " -- " + dates_list[1].strftime("%D") if dates_list[1]
    dates = "N/A" if !dates
    return dates
  end
  def format_priority(priority)
    value = " ⇧".colorize(:red) if priority == "high"
    value = " ⇨".colorize(:magenta) if priority == "medium"
    value = " ⇩".colorize(:yellow) if priority == "low"
    value = "" if !priority
    return value
  end
end
