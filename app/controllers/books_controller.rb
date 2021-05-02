class BooksController < ApplicationController
  def index
      @lists = List.all
      @list = List.new(list_params)
  end

  def show
      @list = List.find(params[:id])
  end

  def create
      @list = List.new(book_params)
      if @list .save
          redirect_to book_path(@book)
      else
          render :new
      end
  end

  def edit
      @list  = List.find(params[:id])
  end

  def update
      @list  = List.find(params[:id])
      @list .update(book_params)
      redirect_to book_path(@list )
  end

  def destroy
      @list  = List.find(params[:id])
      @list .destroy
      redirect_to books_path
  end

  private
  def list _params
      params.require(:list ).permit(:title, :body)
  end
  # def new
  #   @list = List.new
  # end

  # def create
  #   list = List.new(list_params)
  #   list.save
  #   redirect_to books_path(list.id)
  # end

  # def index
  #   @lists = List.all
  # end

  # def show
  #   @list = List.find(params[:id])
  # end

  # def edit
  #   @list= List.find(params[:id])
  # end

  # def update
  #   list= List.find(params[:id])
  #   list.update(list_params)
  #   redirect_to books_path(list.id)
  # end

  # def destroy
  #   list = List.find(params[:id])
  #   list.destroy
  #   redirect_to books_path
  # end

  # private

  # def list_params
  #   params.require(:list).permit(:title,:body)
  # end

end