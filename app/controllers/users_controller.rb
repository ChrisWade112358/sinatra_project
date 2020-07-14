class UsersController < ApplicationController

    
    
    
    get '/index' do
        erb :"/users/index"
    end

    get '/user/signup' do
        erb :"users/new" 
    end
    
    get '/user' do
        @users = User.all
        erb :"/users/users_all"
    end

    get '/user/:id' do
        @user = User.find_by_id(params[:user_id])
        erb :"users/show"
    end

    get '/user/:id/edit' do 
        @user = User.find_by_id(params[:user_id])
        erb :"users/edit"
    end
   
   patch '/user/:id/edit' do 
        @user = User.find_by_id(params[:user_id])
        @user.name = params[:name]
        @user.email = params[:email]
        @user.username = params[:username]
        @user.password = params[:password]
        @user.save
        redirect "/user/#{current_user}"
   end
    

    post '/signup' do
        user = User.create(params)
        binding.pry
        if user.save
            redirect '/user/index'
        else
            redirect '/signup'
        end
    end

    
    get '/user/index' do
        erb :"/users/index"
    end

    
    
end