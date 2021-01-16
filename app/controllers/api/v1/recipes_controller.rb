class Api::V1::RecipesController < Api::V1::ApiController

    def index
        @recipes = Recipe.order(created_at: :desc)
        render json: @recipes
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            render json: @recipe, status: :created
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end


    private
        def recipe_params
            params.require(:recipe).permit(:title, :preparation_time, :oven_time, :ingredients, :steps, :Image, :category)
        end

end
