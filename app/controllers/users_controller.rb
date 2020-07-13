class UsersController < ApplicationController
    
    get '/signup' do
        erb :"users/new" 
    end

    post '/signup' do
        user = User.build(params)
        binding.pry
        if user.save
            redirect '/users/index'
        else
            redirect '/users/new'
        end
    end
end