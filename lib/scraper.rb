require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    # fixed url for purposes of this test: "./fixtures/student-site/index.html"
  # [
    # {:name => "Abby Smith", :location => "Brooklyn, NY", :profile_url => "students/abby-smith.html"},
    # {:name => "Joe Jones", :location => "Paris, France", :profile_url => "students/joe-jonas.html"},
    # {:name => "Carlos Rodriguez", :location => "New York, NY", :profile_url => "students/carlos-rodriguez.html"},
    # {:name => "Lorenzo Oro", :location => "Los Angeles, CA", :profile_url => "students/lorenzo-oro.html"},
    # {:name => "Marisa Royer", :location => "Tampa, FL", :profile_url => "students/marisa-royer.html"}
  # ]

    #name css: doc.css(".student-card").css(".student-name").text
    #location css: doc.css(".student-card").css(".student-location").text
    #profile url css: doc.css(".student-card").css("a")[0]["href"]

    #grab html using open-uri
    html = open("./fixtures/student-site/index.html")
    #use nokogiri HTML method to convert string to NodeSet; save into a variable, doc
    doc = Nokogiri::HTML(html)
    binding.pry
    scraped_array = []
    doc.css(".student-card").each do |card|
      student_hash = {}
      student_hash[:name] = card.css(".student-name").text
      student_hash[:location] = card.css(".student-name").text
      student_hash[:name] = card.css(".student-name").text
    end

    student_hash



  end

  def self.scrape_profile_page(profile_url)

        #EXPECTED OUTPUT:

        # { :twitter=>"http://twitter.com/flatironschool",
        #   :linkedin=>"https://www.linkedin.com/in/flatironschool",
        #   :github=>"https://github.com/learn-co,
        #   :blog=>"http://flatironschool.com",
        #   :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
        #   :bio=> "I'm a school"
        #  }

  end

end
