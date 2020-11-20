module ApplicationHelper
  def my_icon(icon_name, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'social_icons', "#{icon_name}.svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'

    options.each { |attr, value| svg[attr.to_s] = value }

    doc.to_html.html_safe
  end

  def all_routes
    routes = []
    Category.all.each do |cat|
      routes << (link_to cat.name.capitalize, category_path(cat.slug), class: 'nav-link')
    end

    routes
  end
end
