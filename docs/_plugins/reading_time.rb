# _plugins/reading_time.rb
module ReadingTimeFilter
  def reading_time(input)
    words_per_minute = 180
    image_seconds = 5
    words = input.split.size
    images = input.scan(/!\[\]\(.*?\)/).size + input.scan(/<img\s[^>]*?src\s*=\s*['\"]([^'\"]*?)['\"][^>]*?>/).size
    minutes = ((words / words_per_minute) + (images * image_seconds/60)).floor
    minutes_label = minutes === 1 ? " minute" : " minutes"
    minutes > 0 ? "#{minutes} #{minutes_label}" : "Less than 1 minute"
  end
end

Liquid::Template.register_filter(ReadingTimeFilter)