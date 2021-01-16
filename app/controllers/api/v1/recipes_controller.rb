class Api::V1::RecipesController < Api::V1::ApiController

    def index
        @recipes = Recipe.order(created_at: :desc)

        render json: @recipes
    end

end
