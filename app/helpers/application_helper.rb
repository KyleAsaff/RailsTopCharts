module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "App Store"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def nav_link(link_text, link_path)
    if current_page?('/') && link_text == 'Paid'
      class_name = 'active'
      content_tag(:li, :class => class_name) do
        link_to link_text, link_path
      end
    else
      class_name = current_page?(link_path) ? 'active' : ''
      content_tag(:li, :class => class_name) do
        link_to link_text, link_path
      end
    end
  end
end
