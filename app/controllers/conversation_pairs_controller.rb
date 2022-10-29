class ConversationPairsController < ApplicationController
  def index
    @pairs = ConversationPair.includes(:base, :target).all
  end

  def create
    @pair = ConversationPair.new(pair_params)
    if @pair.save
      render status: 200
    else
      @errors = @pair.errors.full_messages
      render "error", status: 400
    end
  end

  def destroy
    @pair = ConversationPair.find(params[:id])
    if @pair.destroy
      render "create", status: 200
    else
      @errors = @pair.errors.full_messages
      render "error", status: 400
    end
  end

  private

  def pair_params
    params.require(:pair).permit(:base_id, :target_id)
  end
end
