=begin
Implement following methods into TodoList class:
find_by_title 	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
all_done 	      returns new TodoList object containing only the done items
all_not_done 	  returns new TodoList object containing only the not done items
mark_done 	    takes a string as argument, and marks the first Todo object that matches the argument as done.
mark_all_done 	mark every todo as done
mark_all_undone mark every todo as not done
=end

class Todo
  DONE_MARKER = "x"
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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
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

  # rest of class needs implementation
  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
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

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each {|todo| todo.done!}
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete_at(idx)
  end

  def to_s
    p text = "---- #{title} ----\n"
    p text << @todos.map(&:to_s).join("\n")
    p text
  end

  def to_a
    @todos.clone
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    new_list = TodoList.new("Yeah Man List")

    self.each do |todo|
      new_list.add(todo) if yield(todo)
    end

    new_list
  end

  def find_by_title(str)
    select {|todo| todo.title == str}.first
  end

  def all_done
    select {|todo| todo.done?}
  end

  def all_not_done
    select {|todo| !todo.done?}
  end

  def mark_done(title)
    each {|todo| todo.done! if todo.title == title }
  end

  def mark_all_done
    each {|todo| todo.done! }
  end

  def mark_all_undone
    each {|todo| todo.undone! }
  end

end




# given
todo1 = Todo.new("Buy milk")
todoCH = Todo.new("Jump Up")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todoCH)
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

list.mark_done_at(1)
list.mark_done_at(3)

puts
#puts list

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

# puts

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

p list.find_by_title("Jump Up")
puts
p list.all_done
puts
p list.all_not_done
puts
p list.mark_done("Buy milk")
puts
p list.mark_all_done
puts
p list.mark_all_undone
puts

p list
p list.first