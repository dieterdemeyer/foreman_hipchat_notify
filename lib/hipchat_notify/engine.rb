module HipchatNotify
  #Inherit from the Rails module of the parent app (Foreman), not the plugin.
  #Thus, inhereits from ::Rails::Engine and not from Rails::Engine
  class Engine < ::Rails::Engine

    # Include extensions to models in this config.to_prepare block
    config.to_prepare do
      return unless TemplateKind.table_exists?
      ::UnattendedController.send :include, HipchatNotify::UnattendedControllerExtensions
    end

    #initializer 'hipchat_notify.load_default_settings', :before => :load_config_initializers do |app|
    #  require_dependency File.expand_path("../../../app/models/setting/hipchat_notify.rb", __FILE__)
    #end

  end
end
