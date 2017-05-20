module ApplicationHelper
  # Set HTML title on head tag
  def full_title(page_title = '')
    base_title = "SOAT"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def price(num)
    number_to_currency(num, delimiter: '.', precision: 0)
  end
end
