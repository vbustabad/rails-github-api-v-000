class RepositoriesController < ApplicationController

  def index
    response = Faraday.get("https://api.github.com/user") do |request|
      request.body = { 'oauth_token': session[:token] }
      request.headers['Authorization'] = 'token OAUTH-TOKEN'
    end
    @login = JSON.parse(response.body)["response"]["owner"]["login"]

    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.body = { 'oauth_token': session[:token] }
      req.headers['Authorization'] = 'token OAUTH-TOKEN'
    end
    @repositories = JSON.parse(resp.body)["response"]["owner"]["repo_url"]
  end

  # def create
  # end
end
