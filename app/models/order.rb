class Order < ApplicationRecord
  belongs_to :product

  def send_simple_message(order_params, domain)
    email = 'nikita.arar@gmail.com'

    @product = Product.find(order_params[:product_id])

    RestClient.post "https://api:75a2b5fb22bd04ecc9ab87bb81828e39-52cbfb43-4e467699"\
        "@api.mailgun.net/v3/sandboxeb1c0e0ef3404c488fdda4b3dd9530cd.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandboxeb1c0e0ef3404c488fdda4b3dd9530cd.mailgun.org>",
        :to => email,
        :subject => "Куплен товар в интернет-магазине",
        :text => "В интернет-магазине куплен товар:
                \nid: " + order_params["product_id"] + "
                \nНазвание: " + @product.title + "
                \nЦена: " + @product.price.to_s + " грн.

                \n\nИнформация о покупателе:
                \nИмя: " + order_params["name"] + "
                \nТелефон: " + order_params["phone"] + "
                \nE-mail: " + order_params["email"] + "
                \nИнформация о доставке: " + order_params['delivery_info'],


        :html => "В интернет-магазине куплен товар:
                <br><b>Название:</b> <a href='" + domain + Rails.application.routes.url_helpers.product_path(@product)+ "'>" + @product.title + "</a>
                <br><b>Цена:</b> " + @product.price.to_s + " грн.

                <hr>
                <b><u>Информация о покупателе:</u></b>
                <br><b>Имя:</b> " + order_params["name"] + "
                <br><b>Телефон:</b> " + order_params["phone"] + "
                <br><b>E-mail:</b> <a href='mailto:" + order_params["email"] + "'>" + order_params["email"] + "</a>
                <br><b>Информация о доставке:</b> " + order_params['delivery_info']
    # You can see a record of this email in your logs: https://app.mailgun.com/app/logs

    # You can send up to 300 emails/day from this sandbox serverv.
    # Next, you should add your own domain so you can send 10,000 emails/month for free.
  end

end