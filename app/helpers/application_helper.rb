module ApplicationHelper
  def days_til_event
    results = ""
    if Date.today < Date.parse('2011-02-03')
      results = " Only "
      results += distance_of_time_in_words(Date.today,Date.parse('2011-02-03')).to_s
      results += " until the Workshops and Conference begin."
    else
      results = "LA Ruby Conference 2011 was <strong>"
      results += distance_of_time_in_words(Date.today,Date.parse('2011-02-03')) 
      results += "</strong> ago."
    end
    return results
  end

  def random_tag_line
    @conference = Presentation.find(:all,
                                    :order => 'presentation_date_time',
                                    :conditions =>
                        ['presentation_date_time > ?', '2011-02-05 12:00 AM']
                                    )
    @presentation = @conference[rand(@conference.count)]

    "Don't miss #{@presentation.title} by #{display_speakers(@presentation)}!"
  end

  def big_number value, cols = 3
    value = value.to_i
    case
    when cols = 3
      case
      when value < 100
        size = "9em"
      when value < 1000
        size = "7em"
      when value < 100000
        size = "5.5em"
      when value < 1000000
        size = "5em"
      when value < 10000000
        size="4.5em"
      when value < 100000000
        size = "4em"
      when value < 100_000_000_000
        size = "3.75em"
      when value < 1_000_000_000_000
        size = "3.5em"
      else
        size = "3.25em"
      end
    end

    a = "<p class='big_number' style='font-size: #{size}'>"
    b = number_with_delimiter(value, :delimiter => ',')

    "#{a} #{b}</p>"
  end

  def google_search_link value
    link_to value,  
            "http://google.com/search?q=#{value.gsub(' ','+').downcase}",
            :target => "_blank"
  end

end
