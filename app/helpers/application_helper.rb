module ApplicationHelper
  def testcase(date)
    selecteddays = Cost.where(date: date.all_week).order(date: :desc)
    sum = 0
    selecteddays.each do |selectedday|
      sum += selectedday.cost_details.sum(:price)
    end
    return sum
  end
end
