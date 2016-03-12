class LinkItem
  include Listable
  attr_reader :description, :site_name
  @@item_type = "link"
  def item_type
    @@item_type
  end
  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end
  def format_name
    @site_name ? @site_name : ""
  end
  def details
    format_description(@description) +
    format_item_type(self.item_type)+
    "site name: " + format_name
  end
end
