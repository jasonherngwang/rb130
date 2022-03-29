# Arity of lambdas, procs, and implicit blocks

=begin
Group 1
Procs can be created using Proc::new or proc { ... }
my_proc has 1 parameter and prints a String.
Invoking #puts and passing in my_proc prints the class, object id encoding, and location in .rb file.
Invoking Proc#call w/o arguments: Parameter `thing` is nil due to lenient arity.
Passing a String: String is interpolated into output.
=end
puts "Procs---------------------------"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin
Group 2
Lambdas can be created using 2 different syntax.
Invoking #puts and passing in my_lambda will indicate that it is a lambda, to differentiate it from a proc.
The class of a lambda object is Proc. There is no Lambda class.
- Therefore invoking Lambda::new raises a NameError.
Lambdas behave like procs when invoked with the required number of arguments.
If the incorrect number of arguments is passed, raises ArgumentError due to strict arity.
=end
puts "Lambdas---------------------------"
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
# Group 3
Any method can be implicity passed a block.
When yielding to the block and not passing enough arguments, any parameters 
that did not receive an argument will be nil due to lenient arity.
- Blocks passed to method invocations behave like procs, not lambdas, with respect to arity.
Invoking yield but not receiving a block will raise a LocalJumpError exception.
=end
puts "Block Methods---------------------------"
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin
# Group 4
Blocks passed to a method cannot access local variables inside the method, 
unless passed in to the block as arguments.
Blocks are scoped at the time of creation.
=end
puts "Block Methods 2---------------------------"
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# animal = 'dog'
block_method_2('turtle') { puts "This is a #{animal}."}