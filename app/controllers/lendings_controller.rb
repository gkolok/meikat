class LendingsController < ApplicationController
  respond_to :html
  before_action :set_book, only: [:new, :create, :edit, :update]
  
  def new
    @lending = @book.lendings.new
  end

  def create
    @book.allapot = :kolcsonozve
    @lending = @book.lendings.new(lending_params)
    respond_to do |format|
      @lending.save
      @book.save
      format.html { redirect_to  books_path}
    end
  end

  def lending_params
      params.require(:lending).permit(:book_id, :lender)
  end

  def edit
    @lending = @book.lendings.last
  end

  def update
    @book.allapot = nil
    respond_to do |format|
      @book.save
      format.html { redirect_to  books_path}
    end
  end

  def set_book
    @book = Book.find params[:book_id]
  end
end
