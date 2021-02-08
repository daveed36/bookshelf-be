class CollectionsController < ApplicationController

    def create
      @collection = Collection.new({ name: params[:name], user_id: params[:user_id] })
  
      if @collection.valid?
        @collection.save
        render json: @collection
      else
        render json: { error: @collection.errors.full_messages }
      end
    end
  end
  