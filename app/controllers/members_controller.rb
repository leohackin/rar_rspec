class MembersController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def winner
    w = Member.pick_a_winner

    respond_to do |format|
      format.json { render :json => w }
    end
  end
end
