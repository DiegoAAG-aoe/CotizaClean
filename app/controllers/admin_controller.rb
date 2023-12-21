class AdminController < ApplicationController
    before_action :require_admin, only: [:admin_dashboard]

def admin_dashboard
  # ... admin-specific actions
end

private

def require_admin
  redirect_to root_path unless user_signed_in? && current_user.admin?
end

end