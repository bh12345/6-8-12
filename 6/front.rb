
require_relative 'back'

p minmax(0.0, 2.0, 0.01){ |x| (x - 1.0) / (x + 2.0) }
p minmax(0.0, 2.0, 0.01, (->(x){ (x - 1.0) / (x + 2.0) }))
p minmax(-1.0, 1.0, 0.01){ |x| Math.sin(x / 2 - 1) }
p minmax(-1.0, 1.0, 0.01, (->(x){ Math.sin(x / 2 - 1) }))