class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date
  @@item_type = "event"
  def item_type
    @@item_type
  end
  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end
  def details
    [format_description(@description),
    format_item_type(self.item_type),
    "event dates: "+format_date(@start_date, @end_date)]
  end
end
