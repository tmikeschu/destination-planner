class Day
  def initialize(day_attrs)
    @day_attrs = day_attrs
    @date = format_date
    @high_temp = day_attrs[:high][:fahrenheit]
    @low_temp = day_attrs[:low][:fahrenheit]
    @conditions = day_attrs[:conditions]
  end

  def format_date
    "#{@day_attrs[:date][:weekday]}, "  \
    "#{@day_attrs[:date][:monthname]} " \
    "#{@day_attrs[:date][:day]}"
  end
end
