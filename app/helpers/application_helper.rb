module ApplicationHelper
  def page_name_with_enclosing(name)
    name + " for #{h enclosing_resource_name}: " + link_to( "#{h enclosing_resource.name}", enclosing_resource_path )
  end
end
