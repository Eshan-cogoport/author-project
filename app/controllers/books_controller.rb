class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if params[:id]
            @books=Book.find(params[:id])
            @authors=Author.find(@books.author_id)
            books=Book.joins(:author).select('*').where(author_id: @authors.id)
        elsif
            books=Book.all
        end
        render json: books
    end

    def create
        @books=Book.create(:title=> params[:title],:date=> params[:date],:author_id=>params[:id],:category=> params[:category],:isbn=> params[:isbn])
        render json: @books
    end

    def update
        @books=Book.find(params[:id])
        @books.update(:title=> params[:title],:date=> params[:date],:category=> params[:category],:isbn=> params[:isbn])
        render json: @books
    end

    def delete
        Book.destroy(params[:id])
    end
end