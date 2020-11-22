module ApplicationHelper
  def my_icon(icon_name, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'icons', "#{icon_name}.svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'

    options.each { |attr, value| svg[attr.to_s] = value }

    doc.to_html.html_safe
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: 'active')
    else
      link_to(text, url)
    end
  end

  def all_routes
    routes = []
    Category.all.each do |cat|
      routes << (nav_link_to cat.name.capitalize, category_path(cat.slug))
    end

    routes
  end

  def vote?(user, article)
    output = ''

    if user&.votes?(article)
      output << link_to(my_icon('filled-vote', class: 'vote-icons'), article_vote_path(article), method: :delete, remote: true)
    else
      output << link_to(my_icon('unfilled-vote', class: 'vote-icons'), article_vote_path(article), method: :post, remote: true)
    end
    output.html_safe
  end
end
