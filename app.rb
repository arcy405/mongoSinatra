require 'sinatra'
require 'mongoid'

configure :development do
    enable :logging, :dump_errors, :run, :sessions
    Mongoid.load!(File.join(File.dirname(__FILE__), "config", "mongoid.yml"))
  end
  
  get '/db' do
    "db: " <<  Mongoid.default_session[:moped].database.inspect
  end
  get '/' do
    "Hello World mongodb"
  end
#   class Post
#     include Mongoid::Document
  
#     field :title, type: String
#     field :body, type: String
  
#     has_many :comments
#   end
  
#   class Comment
#     include Mongoid::Document
  
#     field :name, type: String
#     field :message, type: String
  
#     belongs_to :post
#   end

#   get '/posts' do
#     Post.all.to_json
#   end
  
#   post '/posts' do
#     post = Post.create!(params[:post])
#     post.to_json
#   end
  
#   get '/posts/:post_id' do |post_id|
#     post = Post.find(post_id)
#     post.attributes.merge(
#       comments: post.comments,
#     ).to_json
#   end
  
#   post '/posts/:post_id/comments' do |post_id|
#     post = Post.find(post_id)
#     comment = post.comments.create!(params[:comment])
#     {}.to_json
#   end