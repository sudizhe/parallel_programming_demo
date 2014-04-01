fib = Fiber.new do
  f1 = f2 = 1
  loop do
    Fiber.yield f1
    f1, f2 = f2, f1 + f2
  end
end

5.times { p fib.resume }