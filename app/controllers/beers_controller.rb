class BeersController < ApplicationController

  def show
    @beer = Beer.find_beer(params[:id])
  end

  def index
    @beers = Beer.all
  end

  def create
    @beer = Unirest.post("#{ENV['API_URL']}/beers", parameters: {name: params[:name], style: params[:style], hop: params[:hop],
     yeast: params[:yeast], malts: params[:malts], ibu: params[:ibu], alcohol: params[:alcohol]},
     headers: {"Accept" => "application/json", "Authorization" => "#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body

     redirect_to beer_path(@beer["id"])
   end


  def edit
    @beer = Unirest.get("#{ENV['API_URL']}/beers/#{params[:id]}.json").body
  end

  def update
    @beer = Unirest.patch("#{ENV['API_URL']}/beers/#{params[:id]}", parameters: {name: params[:name], style: params[:style], hop: params[:hop],
     yeast: params[:yeast], malts: params[:malts], ibu: params[:ibu], alcohol: params[:alcohol]},
     headers: {"Accept" => "application/json", "Authorization" => "#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body
     redirect_to beer_path(@beer["id"])
  end

  def destroy
    @beer = Beer.find_beer(params[:id])
    @beer.delete_beer
    redirect_to "/beers"
  end


end
