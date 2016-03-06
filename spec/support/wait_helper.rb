require_relative '../support/ui_helper'

module WaitHelper
  include UIHelper

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def wait_for_chunk_count(count)
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until chunk_segments.size == count
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
