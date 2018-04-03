class LrController < ApplicationController

  before_action :check_login, only: :view

  def index
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
      if res = LrResult.find_by_str( str )
        @result = ActiveSupport::JSON::decode( res.result )
      else
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
        @result = strlenArr.each_index.collect{ |i| [strlenArr[i], strArr[i]] }
        @result += [['Максимальная длина отрезка', strlenArr.max],['Всего отрезков', strArr.size]]
        res = LrResult.create :str => str, :result => ActiveSupport::JSON::encode( @result )
        res.save
      end
    end
    def check_login
      unless logged_in?
        redirect_to signin_url
        flash[:message] = 'Вы не авторизованы'
      end
    end
end
