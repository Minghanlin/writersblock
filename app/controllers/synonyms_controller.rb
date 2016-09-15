class SynonymsController < ApplicationController
  def index
    @search_term = ""
    query = request.query_parameters
    if query.has_key?(:searchterm)
      @search_term = query[:searchterm]
    end
    puts "searching " + @search_term

    @test = Synonym.get('/'+@search_term+'?key=8736cc65-28aa-409d-a2a6-3e910ab54cae')
    puts @test
    if @test.length >0
      @test = @test
    else
      @test = "There is nothing"
    end


  end


end
