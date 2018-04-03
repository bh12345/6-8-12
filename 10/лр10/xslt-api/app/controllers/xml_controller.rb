class XmlController < ApplicationController
  before_action :parse_params, only: :index
  def ifPerfect (number)
    sumi=0
    for i in 1...number do
      if number.modulo(i)==0
        sumi+=i
      end
    end
    if sumi==number
      true
    else
      false
    end
  end
  def index
   sArr=@str.scan(/[0-9]+/)
   iArr=Array.new(sArr.size)
   sArr.each_index do |i|
     iArr[i]=ifPerfect(sArr[i].to_i)
   end
   strArr=Array.new
   strlenArr=Array.new
   segment=-1
   if iArr[0]
     segment+=1
     strArr[segment] = sArr[0].to_s
     strlenArr[segment] = 1
   end
   for i in 1...sArr.size
     if iArr[i]&&iArr[i-1]
       strArr[segment] += ', ' + sArr[i].to_s
     elsif iArr[i]
       segment+=1
       strArr[segment] = sArr[i].to_s
     end
   end

   data = if strArr.nil?
            { message: "Неверные параметры запроса (str = #{@str})" }
          else
            strArr.map { |elem| { elem: elem, size: elem.scan(/,+/).size+1 } }
          end

   respond_to do |format|
     format.xml { render xml: data.to_xml }
     format.rss { render xml: data.to_xml }
    end
  end

  protected

  def parse_params
   @str = params[:str]
  end
end
