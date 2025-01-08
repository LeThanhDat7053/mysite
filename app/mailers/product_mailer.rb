class ProductMailer < ApplicationMailer
  def in_stock(product)
    @product = product

    mail(to: 'recipient@example.com', subject: 'In stock') do |format|
      format.text { render plain: "In stock" }
      format.html { render html: "<h1>In stock</h1>".html_safe }
    end
  end
end
