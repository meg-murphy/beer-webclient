class Beer
attr_accessor :id, :name, :style, :alcohol, :hop, :yeast, :malts, :ibu
  def initialize(input)
    @id = input["id"]
    @name = input["name"]
    @style = input["style"]
    @alcohol = input["alcohol"]
    @hop = input["hop"]
    @yeast = input["yeast"]
    @malts = input["malts"]
    @ibu = input["ibu"]
  end

  def name_and_style
    return "#{@name}, an #{@style}"
  end

  def self.find_beer(id)
    unirest_beer = Unirest.get("#{ENV['API_URL']}/beers/#{id}.json", headers: {"Authorization" => "#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body
    beer = Beer.new(unirest_beer)
    return beer
  end

  def self.all
    unirest_beers = Unirest.get("#{ENV['API_URL']}/beers.json", headers: {"Authorization" => "#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body
    beers = []
    unirest_beers.each do |unirest_beer|
      beer = Beer.new(unirest_beer)
      beers << beer
    end
    return beers
  end

  def delete_beer
    #write an instacne method because only need to call it on one employee
    beer = Unirest.delete("#{ENV['API_URL']}/beers/#{id}.json", headers: {"Authorization" => "#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body
  end

  end


  # beer = Beer.new
  # beer.something  => instance method

  # Beer.something  => class method
