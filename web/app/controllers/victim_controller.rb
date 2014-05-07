class VictimController < ApplicationController

  def index
    Victim.all
  end

end
