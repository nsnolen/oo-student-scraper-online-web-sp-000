require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students =[]
    page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_name = student.css('.student-name').text
        student_location = student.css('.student-location').text
        student_profile_link = "#{student.attr('href')}"
        students<<{location:student_location, name:student_name, profile_url:student_profile_link}
      end
    end
    students

  end

  def self.scrape_profile_page(profile_url)
    studnet = {}
    profile_page = Nokogiri::HTML(open(open_slug))
    links = profile_page.css(".social-icon-container").children.css('a').map{|el| el.attribute('href').value}
      links each do |link|
        if link.include?("linkedin")
          student[:linkedin] = link
        elsif link.include?("github")
            student[:github] = link
          elsif link.include?("twitter")
              student[:twitter] = link
            else student[:blog] = link
            end
          end
            student

  end

end
