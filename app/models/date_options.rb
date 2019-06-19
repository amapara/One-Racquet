class DateOptions
  def initialize(date_params)
    @today      = date_params[:today] == "on"
    @tomorrow   = date_params[:tomorrow] == "on"
    @overmorrow = date_params[:overmorrow] == "on"
    @time_range = date_params[:time_range].split(";")
  end

  def dates
    # Array of dates
    dt = []
    dt << ((DateTime.parse("#{Date.today.to_s} #{@time_range[0]}"))..(DateTime.parse("#{Date.today.to_s} #{@time_range[1]}"))) if @today
    dt << ((DateTime.parse("#{Date.tomorrow.to_s} #{@time_range[0]}"))..(DateTime.parse("#{Date.tomorrow.to_s} #{@time_range[1]}"))) if @tomorrow
    dt << ((DateTime.parse("#{(Date.today + 2).to_s} #{@time_range[0]}"))..(DateTime.parse("#{(Date.today + 2).to_s} #{@time_range[1]}"))) if @overmorrow
    dt
  end
end
