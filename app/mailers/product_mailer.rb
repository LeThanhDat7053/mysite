class ProductMailer < ApplicationMailer
  def in_stock(product)
    @product = product
    mail(to: "recipient@example.com", subject: "In stock") do |format|
      format.text { render plain: "In stock" }
    end
  end
end
