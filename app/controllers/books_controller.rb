class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json {render json: @books}
      format.xml  {render xml: @books}
    end
  end
end
