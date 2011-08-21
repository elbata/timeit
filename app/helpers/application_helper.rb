module ApplicationHelper

  def current_week
    Time.now.strftime('%W').to_i - 32
  end

  def current_day
    Time.now.strftime('%u').to_i
  end

  def past? week, day
    (week < current_week) || ((week == current_week) && day < current_day)
  end

end
