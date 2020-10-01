class BeersController < ApplicationController
    
#Find all of your beer recipes
    get "/beers" do
        redirect_if_not_logged_in
        @beers = current_user.beers
        erb :"/beers/index"
    end

#Post a new beer recipe
    post "/beers" do
        redirect_if_not_logged_in
        @beer = current_user.beers.build(params[:beer])
    
            if @beer.save
                redirect "/beers"
            else
                @errors = @beer.errors.full_messages
                erb :"/beers/new"
            end
        end

#Make a new beer recipe
    get "/beers/new" do
        redirect_if_not_logged_in
        @beer = Beer.new
        erb :"/beers/new"
    end

#Show a specific beer recipe
    get "/beers/:id" do
    @beer = Beer.find_by(id: params[:id]) 
        if @beer && @beer.user == current_user
            erb :"/beers/show"
        #if beer belongs to user
        else
            redirect "/beers"
        end
    end

#Find a specific beer recipe to edit
    get "/beers/:id/edit" do
        @beer = Beer.find_by(id: params[:id])
        if @beer && @beer.user == current_user
            erb :"/beers/edit"
      
        else
            redirect "/beers"
        end
       
    end
   
#Edit the specific beer recipe
    patch "/beers/:id" do
        @beer = Beer.find(params[:id])
        if @beer.update(params[:beer])
            redirect "/beers"
        else
            erb :"/beers/show"
        end
    end

#Delete the specific beer recipe
    delete "/beers/:id" do
        beer= Beer.find(params[:id])
        beer.destroy
        redirect "/beers"
    end

end