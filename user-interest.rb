require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file("users.yaml")
end

helpers do
  def capitalize(text)
    text.capitalize if text
  end
  
  def user_count
    @users.keys.size
  end
  
  def interests_count
    @users.inject(0) do |sum, (emails, interests)|
      sum += interests.size
    end
  end
end

get "/" do
  erb :home
end

get "/users" do
  erb :users
end

get "/:name" do
  @user_name = params[:name].to_sym
  
  @email = @users[@user_name][:email]
  @interests = @users[@user_name][:interests]
  
  erb :profile
end