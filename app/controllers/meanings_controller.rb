require "httparty"

class MeaningsController < ApplicationController

  def index
    @search_term = ""
    query = request.query_parameters
    if query.has_key?(:searchterm)
      @search_term = query[:searchterm]
    end
    puts "searching " + @search_term
    # if params[:searchterm] != nil
    #   @search_term = params[:searchterm]
    # end
    # @meanings = []
    @test = Meaning.get('/'+@search_term)
    # puts @test
    if @test.length >2
      puts @test[2]['defenition']
      puts @test[1]['defenition']
      puts @test[0]['defenition']

  elsif @test.length >1

      puts @test[1]['defenition']
      puts @test[0]['defenition']

    elsif @test.length >0

      @test = @test[0]['defenition']
      
    else
      @test = "There is nothing"
    end

    # response = HTTParty.get('https://owlbot.info/api/v1/dictionary/'+@search_term)
    #
    # puts response.body, response.code, response.message, response.headers.inspect

  end


end
