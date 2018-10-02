class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
     req.params['oauth_token'] = session[:token]
     req.params['v'] = '20160201'
    end
    @repositories = JSON.parse(resp.body)["response"]["repositories"]["items"]
  end

  # def create
  # end
end
