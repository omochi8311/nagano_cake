class Public::HomesController < ApplicationController
  def top
    @Items =Item.all
  end

  def about
  end
end
