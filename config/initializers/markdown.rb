SanitizedRenderer = Redcarpet::Markdown.new(
  Redcarpet::Render::HTML.new(
    :link_attributes => {rel: "nofollow"},
    :filter_html => true,
    :no_styles => true), 
  :autolink => true, 
  :space_after_headers => true)

MdRenderer = Redcarpet::Markdown.new(
  Redcarpet::Render::HTML, 
  :autolink => true, 
  :space_after_headers => true)
