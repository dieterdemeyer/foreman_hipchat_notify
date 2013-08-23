# Ensure that module is namespaced with plugin name
module HipchatNotify
  # Example: Create new instance and class methods on Foreman's Host model
  module UnattendedControllerExtensions
    extend ActiveSupport::Concern

    included do
      after_create :hipchat_unattended

      private

      def hipchat_unattended
        # params['spoof'] has already been deleted/consumed by
        # UnattendedController so check against fullpath instead
        return if request.fullpath.match /\?spoof=/

        api_token = Setting[:hipchat][:api_token]
        room = Setting[:hipchat][:room]
        from = Setting[:hipchat][:from] || "Foreman"
        color = Setting[:hipchat][:color] || "purple"
        notify = Setting[:hipchat][:notify] || "0"
        message = "test"

        post_data = {
          'room_id' => room,
          'from'    => from,
          'color'   => color,
          'notify'  => notify,
          'message' => "#{@host.name}: #{message}"
        }

        address = "http://api.hipchat.com/v1/rooms/message?format=json&auth_token=#{api_token}"

        logger.debug "Sending message to #{address}"
        begin
          Net::HTTP.post_form(URI(address), post_data)
        rescue Errno::ECONNREFUSED
          logger.info "Connection refused from #{address}"
        rescue => e
          puts e.class
          puts e.message
          puts e.backtrace
        end
      end

    end
  end
end
