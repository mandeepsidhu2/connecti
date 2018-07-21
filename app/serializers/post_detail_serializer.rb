class PostDetailSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:commentLength
  belongs_to :user
  def commentLength
  	return object.comments.length
  end
end
