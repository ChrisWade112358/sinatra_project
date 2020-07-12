class SessionsController < ApplicationController
    
    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        binding.pry
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:user_name] = user.name
            session[:user_email] = user.email
            redirect '/managment/index'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end