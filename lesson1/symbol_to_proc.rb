def my_method
	yield(42)
end

# Approach 1
my_proc = :to_s.to_proc
p my_method(&my_proc)         # => '42'

# Approach 2
p my_method(&:to_s)