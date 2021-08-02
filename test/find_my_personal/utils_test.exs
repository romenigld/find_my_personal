defmodule FindMyPersonal.UtilsTest do
  use ExUnit.Case
  alias FindMyPersonal.Utils

  test "should convert date br" do
    today = Date.utc_today()
    assert 0 == Utils.age(Date.add(today, -20))
    assert -1 == Utils.age(today)
  end

  test "should birth date" do
    assert "20/9/2020" == Utils.convert_br(~D(2020-09-20))
  end
end
