class WebsiteController < ApplicationController
  def index
    @token = nil
  end

  def donate
    amount = params[:amount]
    omise_token = params[:omise_token]
    charity = params[:charity] == 'random' ? Charity.all.to_a.sample : Charity.find_by(id: params[:charity])
    if omise_token.present? && charity.present?
      if amount.present? && amount.to_i >= 20

        charge = Omise::Charge.create({
          amount: amount.to_f * 100,
          currency: "THB",
          card: omise_token,
          description: "Donation to #{charity.name} [#{charity.id}]",
        })

        !charge.paid ? donate_fail : donate_success(charity, charge.amount / 100)
      else
        @token = retrieve_token(omise_token)
        donate_fail(@token)
      end
    else
      donate_fail
    end
  end

  # Donate failed action
  def donate_fail(token = nil)
    @token = token
    flash.now.alert = t(".failure")
    render :index
    return
  end

  # Donate success action
  def donate_success(charity, amount)
    charity.credit_amount(amount)
    flash.notice = t(".success")
    redirect_to root_path
  end

  private

  def retrieve_token(token)

      Omise::Token.retrieve(token)

  end
end
