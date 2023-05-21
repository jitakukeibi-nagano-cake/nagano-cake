class Admin::GenresController < ApplicationController
    
    
    def index
        @category = Category.new
        @categories = Category.all
    end
    
    def edit
        
    end
    
    def create
        @category = Category.new(category_params)
        @category.save
        flash[:notice] = "#{@category.name}を追加しました"
        redirect_to admin_genres_path
    end
    
    def update
        
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
    
end
