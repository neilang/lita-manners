module Lita
  module Handlers
    class Manners < Handler
      route(/^(hi|hello|hey|howdy|bye|goodbye)!*$/i, :echo_command, command: true)
      route(/^(hi|hello|hey|howdy|bye|goodbye)\s+@?(.+)$/i, :echo_message, command: false)
      route(/^(thanks|thank\s?you|cheers)!*$/i, :thank_you_command, command: true)
      route(/^(thanks|thank\s?you|cheers)\s+@?(.+)$/i, :thank_you_message, command: false)

      def echo_command(response, message = nil)
        echo = message || response.matches[0][0]
        response.reply "#{echo} #{response.user.name}"
      end

      def echo_message(response)
        message = response.matches[0][0]
        echo_command(response, message) if addressed_to_robot?(response)
      end

      def thank_you_command(response)
        response.reply "You're welcome #{response.user.name}"
      end

      def thank_you_message(response)
        thank_you_command(response) if addressed_to_robot?(response)
      end

      private

      def addressed_to_robot?(response)
        address = response.matches[0][1].downcase
        bot_name = robot.mention_name.downcase
        address.downcase == bot_name
      end
    end

    Lita.register_handler(Manners)
  end
end
