require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../todolist'

class TodoListTest < MiniTest::Test

  def setup                                        # => Setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)               # => Assert( Execute )
  end

  def test_size
    assert_equal(3, @list.size)                    # Hardcode Integer 3, not @todos.size
  end

  def test_first
    assert_equal(@todo1, @list.first)
    # assert_same(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_typeerror_when_adding_non_todo_obj
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('do dishes') }
    assert_raises(TypeError) { @list.add(Hash.new) }
  end

  def test_shovel
    @todo4 = Todo.new("Wash dishes")
    @list << @todo4
    @todos << @todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_add_todo
    @todo4 = Todo.new("Wash dishes")
    @list.add @todo4
    @todos << @todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @list.item_at(1).done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_some_done
    output = <<~OUTPUT
    --- Today's Todos ---
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    
    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_undone
    output = <<~OUTPUT
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.title.prepend("I don't want to ")}
    assert_equal("I don't want to Buy milk", @todo1.title)
    assert_equal("I don't want to Clean room", @todo2.title)
    assert_equal("I don't want to Go to gym", @todo3.title)
  end

  def test_each_return_value
    assert_same(@list, @list.each {})
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end
end