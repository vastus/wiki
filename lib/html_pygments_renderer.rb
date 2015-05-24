class HTMLPygmentsRenderer < Redcarpet::Render::HTML
  def block_code(code, lang)
    Pygments.highlight(code, :lexer => lang)
  end
end

