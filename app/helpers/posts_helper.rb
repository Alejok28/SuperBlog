module PostsHelper
  def form_title
    @post.new_record? ? "Nuevo Post" : "Modificar Post"
  end
end
