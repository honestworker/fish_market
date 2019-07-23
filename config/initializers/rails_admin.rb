RailsAdmin.config do |config|
  ### Popular gems integration
  config.compact_show_view = false

  config.parent_controller = '::ApplicationController'
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.main_app_name = "يوم السمك"
  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index  do
      except ['About']
    end                           # mandatory
    new do
      except [Order, User]
    end
    export
    bulk_delete
    show
    edit
    delete do
      except ['About']
    end
    show_in_app

  end

  config.model 'OrderItem' do
    visible false
  end

  config.model 'ProductImage' do
    visible false
  end

  config.model 'Quantity' do
    visible false
  end
  config.navigation_static_label = ""
  config.navigation_static_links = {
    'About' => '/admin/about/1/edit'
  }
  
  config.included_models = [ "OtherService", "TeamMember", "Blog", "City","Slider", "Meter", "Admin", "Category", "Product", "Order", "OrderItem","ProductImage","Quantity","IncomingStore","About"]

end

