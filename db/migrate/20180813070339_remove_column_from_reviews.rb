class RemoveColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :job_post_id, :bigint
  end
end
