class MembersController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def winner
    w = Member.pick_a_winner
    w.update_attribute(:win, 1)

    respond_to do |format|
      format.json { render :json => w }
    end
  end
end
