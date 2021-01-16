class Api::V1::RecipesController < Api::V1::ApiController
    before_action :set_recipe, only: [:show, :update, :destroy]

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

    def show
        render json: @recipe
    end

    def destroy
        @recipe.destroy
    end

    def update
        @recipe.update(recipe_params)
    end

    private
        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        def recipe_params
            params.require(:recipe).permit(:title, :preparation_time, :oven_time, :ingredients, :steps, :Image, :category)
        end

end
