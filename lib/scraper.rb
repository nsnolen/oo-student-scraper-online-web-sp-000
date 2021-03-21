require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    studnets =[]
    page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_name = student.css('.student-name').text
        studnet_location = student.css('.student-location').text
        student_profile_link = "#{{student.attr('href')}}"
        students<<{location:student_location, name:studnet_name, profile_url:student_profile_link}

  end

  def self.scrape_profile_page(profile_url)

  end

end
