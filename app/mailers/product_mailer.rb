class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    @product = params[:product]
    subscriber = params[:subscriber]
    if subscriber.present?
      mail(to: subscriber.email, subject: "Product in stock")
    else
      # Xử lý nếu subscriber không hợp lệ
      Rails.logger.error "Subscriber is nil or invalid"
    end
  end
end
