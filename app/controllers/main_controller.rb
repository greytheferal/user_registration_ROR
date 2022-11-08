class MainController < ApplicationController
    def index
        flash[:notice] = "Logged in successfulLy"
        flash[:alert] = "Invalid email or password"
    end
end