require 'test_helper'

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    # Tạo một instance của product (nếu chưa có fixture)
    product = Product.create!(name: "Test Product", price: 100)  # Giả sử bạn có các trường này

    # Gọi mailer và gửi email
    email = ProductMailer.in_stock(product).deliver_now

    # Kiểm tra rằng email đã được gửi
    assert_not ActionMailer::Base.deliveries.empty?

    # Kiểm tra thông tin của email
    assert_equal ["recipient@example.com"], email.to
    assert_equal "In stock", email.subject
    assert_equal "In stock", email.text_part.body.to_s
  end
end
