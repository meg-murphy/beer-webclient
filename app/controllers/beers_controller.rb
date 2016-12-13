class BeersController < ApplicationController

  def show
    @beer = Unirest.get("http://localhost:3001/api/v1/beers/#{params[:id]}.json").body
  end

  def index
    @beers = Unirest.get("http://localhost:3001/api/v1/beers.json").body
  end

  def create
    @beer = Unirest.post("http://localhost:3001/api/v1/beers", parameters: {name: params[:name], style: params[:style], hop: params[:hop],
     yeast: params[:yeast], malts: params[:malts], ibu: params[:ibu], alcohol: params[:alcohol]},
     headers: {"Accept" => "application/json"}).body

     redirect_to beer_path(@beer["id"])
   end


  def edit
    @beer = Unirest.get("http://localhost:3001/api/v1/beers/#{params[:id]}.json").body
  end


  def update
    @beer = Unirest.patch("http://localhost:3001/api/v1/beers", parameters: {id: params[:id], name: params[:name], style: params[:style], hop: params[:hop],
     yeast: params[:yeast], malts: params[:malts], ibu: params[:ibu], alcohol: params[:alcohol]},
     headers: {"Accept" => "application/json"}).body

     redirect_to beer_path(@beer["id"])
  end


end
