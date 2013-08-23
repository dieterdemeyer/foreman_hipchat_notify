module HipchatNotify
  require 'hipchat_notify/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
