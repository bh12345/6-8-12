require 'mathn'

def minmax(a, b, s, f = nil)
  if block_given?
    min = max = yield a
  else
    min = max = f.call a
  end
  while a < b do
    if block_given?
      temp = yield a
    else
      temp = f.call(a)
    end
    min = temp if temp < min
    max = temp if temp > max
    a += s
  end
  [min, max]
end