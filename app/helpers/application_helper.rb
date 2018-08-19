module ApplicationHelper
  def glyphicon(name)
    content_tag(:span, '', class: "glyphicon glyphicon-#{name}") + ' '
  end
end
