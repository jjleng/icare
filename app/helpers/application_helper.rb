module ApplicationHelper
  def title
    if @title.nil?
      return "iCare"
    else
      return "#{@title} | iCare"
    end
  end

  def truncate_wrap_link full_txt, href, truncate_len, line_len
    truncated_text = truncate(full_txt, :length=>truncate_len, :omission=>"...")
    wrapped_text = word_wrap(truncated_text, :line_with=>line_len)
    link_to wrapped_text, href
  end

  def truncate_wrap_text full_txt, truncate_len, line_len
    truncated_text = truncate(full_txt, :length=>truncate_len, :omission=>"...")
    wrapped_text = word_wrap(truncated_text, :line_with=>line_len)
    return wrapped_text
  end

end
