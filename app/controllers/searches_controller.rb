class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @type = params[:type]

    if @model == :book.to_s
      if @type == :perfect.to_s
        @books = Book.where("title = ?", params[:content]).or(Book.where("body = ?", params[:content]))
      elsif @type == :partial.to_s
        @books = Book.where("title LIKE ?", "%#{params[:content]}%").or(Book.where("body LIKE ?", "%#{params[:content]}%"))
      end
    elsif @model == :user.to_s
      if @type == :perfect.to_s
        @users = User.where("name = ?", params[:content]).or(User.where("introduction = ?", params[:content])).or(User.where("email = ?", params[:content]))
      elsif @type == :partial.to_s
        @users = User.where("name LIKE ?", "%#{params[:content]}%").or(User.where("introduction LIKE ?", "%#{params[:content]}%")).or(User.where("email LIKE ?", "%#{params[:content]}%"))
      end
    end
  end
end
