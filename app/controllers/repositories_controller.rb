class RepositoriesController < ApplicationController

  def index
    response = Faraday.get("https://api.github.com/user") do |request|
      request.body = { 'oauth_token': session[:token] }
      request.headers['Authorization'] = 'token 1'
    end
    @login = JSON.parse(response.body)["response"]["creator"]["login"]
    
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.body = { 'oauth_token': session[:token] }
      req.headers['Accept'] = 'application/json'
    end
    @repositories = JSON.parse(resp.body)["response"]["repositories"]["items"]
  end

  # def create
  # end
end
