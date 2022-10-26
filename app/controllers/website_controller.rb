class WebsiteController < ApplicationController
  def index
    @token = nil
  end

  def donate
    donate = DonateService.new(params).donate_charity if valid_process?
    donate ? donate_success : donate_failure
  end

  private

  def valid_process?
    params[:omise_token].present? && params[:charity].present? &&
    params[:amount].present? && params[:amount].to_f > 20
  end

  def donate_success
    flash.notice = t(".success")
    redirect_to root_path
  end

  def donate_failure
    @token = TokenService.new(params[:omise_token]).retrieve_token
    flash.now.alert = t(".failure")
    render :index
  end
end
