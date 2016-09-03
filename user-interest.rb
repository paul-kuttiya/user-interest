require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "yaml"

get "/" do
  @users = YAML.load_file("users.yaml")
  erb :home
end