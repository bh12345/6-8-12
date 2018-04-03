require 'test_helper'

class LrResultTest < ActiveSupport::TestCase
  test 'should test inserting' do
    assert LrResult.create(str: '6 8346 29 456829475878',
      result: '[[1,\"6\"],[\"Максимальная длина отрезка\",1],[\"Всего отрезков\",1]]')
  end

  test 'no to second' do
    res1=LrResult.create(str: '6 8346 29 456829475878',result: '[[1,\"6\"],[\"Максимальная длина отрезка\",1],[\"Всего отрезков\",1]]')

    assert res1.save
    res2=LrResult.create(str: '6 8346 29 456829475878',result: '[[1,\"6\"],[\"Максимальная длина отрезка\",4],[\"Всего отрезков\",1]]')

    assert !res2.save

    res3=LrResult.create(str: '',result: '[[1,\"6\"],[\"Максимальная длина отрезка\",4],[\"Всего отрезков\",1]]')

    assert !res3.save
  end

end
