require 'matrix'
require_relative 'dot'

require 'benchmark'

m1 = Matrix.build(5_000, 5_000) { rand(100) }
m2 = Matrix.build(5_000, 5_000) { rand(100) }

Benchmark.bm do |x|
  x.report("dot:") { m1.dot(m2) }
  x.report("dot_times:") { m1.dot_times(m2) }
  x.report("dot_times_inline:") { m1.dot_times_inline(m2) }
  x.report("dot_each_with_index:") { m1.dot_each_with_index(m2) }
  x.report("dot_each:") { m1.dot_each(m2) }
end
