module PostsHelper
  def price(param)
     if param.nil?
       return "TBD"
     else
       return "$#{param.to_i}"
     end
  end
end
