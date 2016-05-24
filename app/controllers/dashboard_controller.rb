class DashboardController < ApplicationController
  before_filter :authorize_admin!
end
