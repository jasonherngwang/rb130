# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other_todo)
    title == other_todo.title &&
      description == other_todo.description &&
      done == other_todo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.instance_of? Todo
      @todos << todo
    else
      raise TypeError.new('Can only add Todo objects')
    end
  end
  
  alias_method :<<, :add
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def to_a
    @todos.clone
  end
  
  def done?
    @todos.all? { |todo| todo.done? }
  end
    
  def item_at(index)
    @todos.fetch(index)
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each_index { |index| mark_done_at(index) }
  end

  def undone!
    @todos.each_index { |index| mark_undone_at(index) }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    <<~TODO_LIST
    --- #{title} ---
    #{@todos.map(&:to_s).join("\n")}
    TODO_LIST
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    filtered_list = TodoList.new(title)

    each do |todo|
      filtered_list.add(todo) if yield(todo)
    end

    filtered_list
  end

  def find_by_title(todo_title)
    select { |todo| todo.title == todo_title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(todo_title)
    todo = find_by_title(todo_title)
    todo.done! if todo
  end

  def mark_all_done
    each { |todo| todo.done! }
  end
  
  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
puts list
puts

puts "Mark 2nd todo as done."
list.mark_done_at(1)
puts list
puts

puts "Find by title: milk, sandwich"
puts list.find_by_title("Buy milk")
puts list.find_by_title("Buy sandwich")        # Returns nil
puts

puts "All done and All not done"
puts list.all_done
puts list.all_not_done
puts

puts "Mark gym done"
list.mark_done("Go to gym")
list.mark_done("Go to supermarket")            # Not a todo
puts list
puts

puts "Mark all done"
list.mark_all_done
puts list
puts

puts "Mark all undone"
list.mark_all_undone
puts list