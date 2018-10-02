class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
     req.body = { 'oauth_token': session[:token] }
     req.headers['Accept'] = 'application/json'
    end
    @repositories = JSON.parse(resp.body)["response"]["repositories"]["items"]
  end

  # def create
  # end
end
