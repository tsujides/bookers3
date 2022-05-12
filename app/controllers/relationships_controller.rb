class RelationshipsController < ApplicationController

  def follower
    # フォローしているユーザー一覧
    @relationships = Relationship.where(follower_id: params[:user_id])
  end

  def followed
    # フォローされているユーザー一覧
    @relationships = Relationship.where(followed_id: params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    # favorite = current_user.favorites.new(book_id: book.id)
    relationship = Relationship.new(follower_id: current_user.id, followed_id: user.id)
    relationship.save

    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    # favorite = current_user.favorites.find_by(book_id: book.id)
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    relationship.destroy

    redirect_to request.referer
  end
end
