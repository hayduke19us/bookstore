class AuthorsController < ApplicationController
  def index
    @authors = Author.all.sort_by(&:last_name)

    respond_to do |format|
      format.html
      format.json {render json: @authors}
      format.xml  {render xml: @authors}
    end
  end
end
