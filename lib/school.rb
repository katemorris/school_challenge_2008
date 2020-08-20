class School
  attr_reader :start_time, :hours_in_school_day, :student_names

  def initialize(start_time,hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time
    if @start_time.end_with?(":00")
      (@start_time.to_i + @hours_in_school_day).to_s + ":00"
    else
      minutes = @start_time[-3..-1].delete(":").to_f / 60.0
      hours = @start_time.to_i
      converted_start_time = hours + minutes
      unconverted_end_time = converted_start_time + @hours_in_school_day
      if unconverted_end_time % 1 == 0
        unconverted_end_time.to_i.to_s + ":00"
      else
        convert_minutes = (unconverted_end_time % 1) * 60
        convert_hours = unconverted_end_time.to_i
        convert_hours.to_i.to_s + ":" + convert_minutes.to_i.to_s
      end
    end
  end

  def is_full_time?
    @hours_in_school_day > 4
  end

  def standard_student_names
    @student_names.map do |name|
      name.capitalize
    end
  end

  def convert_end_time_to_clock_time
    if self.end_time.end_with?(":00") == true && self.end_time.to_i > 12
      (self.end_time.to_i - 12).to_s + ":00"
    elsif self.end_time.end_with?(":00") == false && self.end_time.to_i > 12
      minutes = @end_time[-3..-1]
      hours = (@end_time.to_i - 12).to_s
      hours + minutes
    else
      return self.end_time
    end
  end
end
