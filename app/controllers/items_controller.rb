class ItemsController < ApplicationController
<<<<<<< HEAD
  before_action :set_item, only: [:show,:purchase,:completed_purchase]
  before_action :set_image, only: [:show,:purchase]
=======
  before_action :set_item, only: [:show,:completed_purchase]
  before_action :checking_login, only: [:purchase]
>>>>>>> a88bef1f677b0e8cffdd405ffd5be7f27ecfbdf7

  def index
  end

  def show
    @seller = @item.seller
    @brand = Brand.find_by_id(@item.brand_id)
    @categories = @item.categories
    @other_uesr_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    @brand_category_items = @categories[-1].items.where(brand_id: @item.brand_id,buyer_id: nil).where.not(id: @item.id)
  end

  def purchase
  end

  def completed_purchase
    ActiveRecord::Base.transaction do
      require 'payjp'
      Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
      Payjp::Charge.create(
        amount:  @item.price,
        card:    params['payjp-token'],
        currency: 'jpy',
      )
      @item.update!(buyer_id: current_user.id)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

<<<<<<< HEAD
  def set_image
    @images = @item.images
=======
  def checking_login
    redirect_to new_user_session_path, notice: "この画面はログインしてからご覧になれます" unless user_signed_in?
>>>>>>> a88bef1f677b0e8cffdd405ffd5be7f27ecfbdf7
  end
end

