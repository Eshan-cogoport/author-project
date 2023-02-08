class AuthorController < ApplicationController
    skip_before_action :verify_authenticity_token

    def read
        render json: Author.all
    end

    def index
        if params[:id]
            @authors=Author.find(params[:id])
            # books=Author.joins(:books).select('*').where(books: {id: params[:id]},author: @books.author_id)
            # authors=Author.joins(:books).select('*').where(author: {} , books: {author_id: author_id})
            authors=@authors.books
        elsif
            authors=Author.all
        end
        render json: authors
    end

    def create
        @authors=Author.create(name: params[:name],email: params[:email],phone: params[:phone])
        render json: @authors
    end

    def update
        @authors=Author.find(params[:id])
        @authors.update(name: params[:name],email: params[:email],phone: params[:phone])
        render json: @authors
    end

    def delete
        Author.destroy(params[:id])
        render html: "deleted"
    end
end