class PlantsController < ApplicationController
    before_action :find_plant, only: [:show]

    def index
        render json: Plant.all, status: :ok
    end

    def show
        render json: @plant, status: :ok
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: 201
    end

    private 

    def find_plant
        @plant = Plant.find(params[:id])
    end

    def plant_params
        params.permit(:name, :image, :price)
    end
end
