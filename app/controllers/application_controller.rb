# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ErrorHandling
  include Pagy::Backend
  add_flash_types :success, :danger
end
