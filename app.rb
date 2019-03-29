# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
#Script is run when the application boots
require './database_connection_setup'
require 'uri'

# Bookmark Manager class
class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do

    # The `=~` operator matches the regular expression against a string, 
    #and it returns either the offset of the match from the string if it is found, otherwise nil.
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'], title: params[:title])
    else
      #The Flash is used to display one-time messages.
      flash[:notice] = "This is an invalid URL."
    end
 
    redirect '/bookmarks'
  end

  # REST routing is applied for delete action
  # Can utilise params[id] from the POST(delete) method to interpolate into SQL to delete the bookmark with that ID, and redirect
  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  # REST routing is applied for update action
  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    # patch action to /bookmarks/:id/edit route to update a bookmark based on id passed in via the params
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
