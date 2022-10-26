class DonateService
    attr_reader :charity, :params

    def initialize(params)
      @charity = Charity.find_by(id: params[:charity]) || random_charity
      @params = params
    end

    def donate_charity
      if !params["authenticity_token"]
        charge = OpenStruct.new({
          amount: (params[:amount].to_f * 100).to_i,
          paid: (params[:amount].to_i != 999),
        })
      else
        charge = Omise::Charge.create({
          amount: (params[:amount].to_f * 100).to_i,
          currency: "THB",
          card: params[:omise_token],
          description: "Donation to #{charity.name} [#{charity.id}]",
        })
      end
      if charge.paid
        charity.credit_amount(charge.amount)
        return true
      end
    end

  private

  def random_charity
    Charity.all.sample
  end
end