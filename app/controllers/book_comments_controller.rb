class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # comment = current_user.book_comments.new(book_comment_params)
    # comment.book_id = book.id
    comment = BookComment.new(
      user_id: current_user.id,
      book_id: @book.id,
      comment: book_comment_params[:comment])
    comment.save

    # redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy

    # redirect_to book_path(params[:book_id])
  end

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
