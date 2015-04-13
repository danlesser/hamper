class ConventionsController < ApplicationController
  def index
    @conventions = Convention.all
  end
end
