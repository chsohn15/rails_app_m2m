class PlantsController < ApplicationController

    def index
        @plants = Plant.all
    end

    def show
        @plant = Plant.find(params[:id])
    end

    def new
        @plant = Plant.new
    end
    
    def create
        @plant = Plant.new(plant_params)

        if @plant.valid?
            @plant.save
            redirect_to plant_path(@plant.id)
        else 
            render :new
        end
    end

    def edit 
        @plant = Plant.find(params[:id])
    end

    def update
        @plant = Plant.find(params[:id])
        @plant.update(plant_params)
        byebug
        if @plant.valid?
            @plant.save
            redirect_to plant_path(plant)
        else
            render :edit
        end
    end

    private

    def plant_params
        params.require(:plant).permit(:name, :price, :img_url)
    end
end
