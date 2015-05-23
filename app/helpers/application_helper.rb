module ApplicationHelper
  def md(s)
    @md ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                    :autolink => true,
                                    :tables => true,
                                    :fenced_code_blocks => true)
    @md.render(s)
  end
end

