class ApiController < ApplicationController
  before_action :authorize!

  private

  def authorize!
    doorkeeper_authorize! :api
  end
end
