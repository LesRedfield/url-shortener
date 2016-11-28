class Link < ActiveRecord::Base

  after_create :generate_short_url

  def generate_short_url
    long = self.long_url

    if long.start_with?('https://www.')
      short = long[12, 3]
    elsif long.start_with?('http://www.')
      short = long[11, 3]
    elsif long.start_with?('https://')
      short = long[8, 3]
    elsif long.start_with?('http://')
      short = long[7, 3]
    elsif long.start_with?('www.')
      short = long[4, 3]
    else
      short = long[0..2]
    end

    short += self.id.to_s(36)

    self.short_url = short
    self.save
  end

end
