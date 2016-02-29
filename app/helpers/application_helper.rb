module ApplicationHelper

  def eid(resource, index, element = nil)
    return "#{resource}-#{index}" unless element
    "#{resource}-#{element}-#{index}"
  end

  def css_eid(*args)
    "##{eid(*args)}"
  end
end
