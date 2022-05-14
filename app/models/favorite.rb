class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.ordered_book_list
    # 過去一週間で「いいね」合計が多い順にソート
    return self.where("created_at > '#{7.days.ago}'")
            .group(:book_id)
            .includes(:book)
            .select(:book_id, 'COUNT(*) AS cnt')
            .order(cnt: :desc)
            .map { |f| f.book } | Book.all
  end

end
