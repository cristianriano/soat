module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active') == 0
  end

  def confirm_dialog
    page.evaluate_script('window.confirm = function() { return true; }')
  end
end
