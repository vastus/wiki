module ApplicationHelper
  require 'html_pygments_renderer'

  def md(s)
    @rendr ||= HTMLPygmentsRenderer.new(:hardwrap => true,
                                        :with_toc_data => true)
    @md ||= Redcarpet::Markdown.new(@rendr,
                                    :autolink => true,
                                    :tables => true,
                                    :fenced_code_blocks => true)
    @md.render(s).html_safe
  end
end

