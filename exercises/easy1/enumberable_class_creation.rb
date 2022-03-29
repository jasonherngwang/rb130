=begin
modify the Tree class to support the methods of Enumerable. 

You do not have to actually implement any methods -- 
just show the methods that you must provide.
=end

class Tree
  include Enumerable

  def each
    # ...
  end

  def <=>(other)
    # ...
  end
end

p Tree.instance_methods