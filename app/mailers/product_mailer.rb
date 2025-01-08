require 'test_helper'

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product = products(:one)  # Nếu bạn sử dụng fixtures hoặc mock cho sản phẩm
    email = ProductMailer.in_stock(product).deliver_now
    
    assert_equal ["recipient@example.com"], email.to
    assert_equal "In stock", email.subject
  end
end
