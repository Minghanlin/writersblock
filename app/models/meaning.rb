class Meaning
  include HTTParty



  # base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  base_uri 'https://owlbot.info/api/v1/dictionary'
  #
  # # default_params fields: "smallIcon,shortDescription", q: "search"
  # format :json
  #
  # def self.for term
  #   get("", query: { query: term} )
  # end

end
