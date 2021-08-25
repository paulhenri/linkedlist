## Linked list implementation with Ruby 

This is an assignment from [The odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/linked-lists) to implement a linked list class with Ruby. Functions implementation covers : 


1. #append(value) adds a new node containing value to the end of the list
2. #prepend(value) adds a new node containing value to the start of the list
3. #size returns the total number of nodes in the list
4. #head returns the first node in the list
5. #tail returns the last node in the list
6. #at(index) returns the node at the given index
7. #pop removes the last element from the list
8. #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
9. #find(value) returns the index of the node containing value, or nil if not found.
10. #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
11. #insert_at(value, index) that inserts a new node with the provided value at the given index.
12. #remove_at(index) 

To go a bit deeper and ease the coding i tried to implement the class with tests - I did not want to manualy test that it was working.

#Example of use

```ruby
	tlist = new LinkedList(5)
	tlist.append(6)
	tlist.prepend(3)
	tlist.at(2).value # returns 6 - Index starts at 1
```

