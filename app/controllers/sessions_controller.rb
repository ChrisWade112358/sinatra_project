class SessionsController < ApplicationController
    
    get '/user/login' do
        erb :"sessions/login"
    end

    post 'user/login' do
        
        user = User.find_by(username: params[:username])
        binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:user_name] = user.name
            session[:user_email] = user.email
            redirect '/user/index'
        else
            redirect 'user/login'
        end
    end

    get '/user/index' do
        erb :"users/index"
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end