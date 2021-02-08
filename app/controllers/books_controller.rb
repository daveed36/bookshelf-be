class BooksController < ApplicationController

    def create
      @book = Book.new({
        title: params[:title],
        authors: params[:authors],
        description: params[:description],
        publisher: params[:publisher],
        image_url: params[:image_url],
        buy_url: params[:buy_url],
        isbn10: params[:isbn10],
        isbn13: params[:isbn13],
        collection_id: params[:collection_id]
      })
  
      if @book.valid?
        @book.save
        render json: @book
      else
        render json: { error: @book.errors.full_messages }
      end
    end
  
    def update 
      @book = Book.find(params[:id])
      @book.update({ collection_id: params[:collection_id]})
  
      render json: @book
    end
  
    def destroy
      Book.destroy([params[:id]])
  
      render json: { message: "delete successful" }
    end
  end
  