
module Listable
  def format_description(description)
    "#{description}".ljust(25)
  end
  def format_date(*dates_list)
    dates = dates_list[0].strftime("%D") if dates_list[0]
    dates << " -- " + dates_list[1].strftime("%D") if dates_list[1]
    dates = "N/A" if !dates
    return dates
  end
end
