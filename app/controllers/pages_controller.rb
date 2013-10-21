class PagesController < ApplicationController
  before_filter :redirect_if_logged_in
end