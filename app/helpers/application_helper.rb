module ApplicationHelper

  def render_svg(name, styles: "fill-current text-gray-400", title: nil)
    file_name = "#{name}.svg"
    title || name.underscore.humanize
    inline_svg(file_name, aria: true, nocomment: true, title: title,)

  end


end
