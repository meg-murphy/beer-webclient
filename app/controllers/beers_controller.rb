class BeersController < ApplicationController

  def show
    @beer = Unirest.get("http://localhost:3001/api/v1/beer/#{params[:id]}.json").body
  end

  def index
    @beers = Unirest.get("http://localhost:3001/api/v1/beer.json").body
  end
end

def create
  
end



response = Unirest.post "http://httpbin.org/post",
                        headers:{ "Accept" => "application/json" },
                        parameters:{ :age => 23, :foo => "bar" }
