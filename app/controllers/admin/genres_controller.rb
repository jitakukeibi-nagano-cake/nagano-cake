class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @new_genre = Genre.new
        @genres = Genre.all
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
        flash[:notice] = "#{@genre.name}を追加しました"
        redirect_to admin_genres_path
        else
        @genres = Genre.all
        render 'index'
        end
    end

    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            redirect_to admin_genres_path, notice: "ジャンルを更新しました。"
        else
            @genres = Genre.all
            render 'index'
        end
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end
    
end
