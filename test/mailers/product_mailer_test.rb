require 'test_helper'

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    # Lấy product từ fixture
    product = products(:one)  # Lấy dữ liệu sản phẩm từ file fixtures/products.yml

    # Gọi mailer và gửi email
    email = ProductMailer.in_stock(product).deliver_now

    # Kiểm tra email đã được gửi
    assert_not ActionMailer::Base.deliveries.empty?

    # Kiểm tra thông tin của email
    assert_equal ["recipient@example.com"], email.to
    assert_equal "In stock", email.subject

    # Kiểm tra body của email
    assert email.text_part.present?, "No text part in the email"
    assert_equal "In stock", email.text_part.body.to_s.strip
  end
end
