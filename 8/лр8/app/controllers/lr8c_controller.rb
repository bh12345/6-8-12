class Lr8cController < ApplicationController
  def input
  end
  def ifPerfect (number)
    sumi = 0
    for i in 1...number do
      if number.modulo(i)==0
        sumi+=i
      end
    end
    if sumi == number
      true
    else
      false
    end
  end
  def view
    str = params[:str]
    @str = str
    sArr = str.scan(/[0-9]+/)
    iArr = Array.new(sArr.size)
    sArr.each_index do |i|
      iArr[i] = ifPerfect(sArr[i].to_i)
    end
    strArr = Array.new
    strlenArr = Array.new
    segment = -1
    if iArr[0]
      segment += 1
      strArr[segment] = sArr[0].to_s
      strlenArr[segment] = 1
    end
    for i in 1...sArr.size
      if iArr[i]&&iArr[i-1]
        strArr[segment] += ', ' + sArr[i].to_s
        strlenArr[segment] += 1
      elsif iArr[i]
        segment += 1
        strArr[segment] = sArr[i].to_s
        strlenArr[segment] = 1
      end
    end
    @arr = strArr
    @lenArr = strlenArr
    @maxArr = strlenArr.max
    @sizeArr = strArr.size
  end
end
