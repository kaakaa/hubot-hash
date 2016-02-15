# Description
#   collect hashtags
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   kaakaa <stooner.hoe@gmail.com>

MESSAGE_KEY = "team-message"

module.exports = (robot) ->
  robot.hear /^(.*)\#team(.*)$/i, (msg) ->
    message = msg.match[1]

    memory = robot.brain.data[MESSAGE_KEY]  
    memory = if memory then memory + message + "\n" else message + "\n"

    robot.brain.data[MESSAGE_KEY] = memory
    robot.brain.save()

    msg.send "learn by heart"

  robot.hear /CLEAR_MESSAGE/i, (msg) ->
    robot.brain.data[MESSAGE_KEY] = undefined
    robot.brain.save()
    
  robot.respond /REPORT_FROM_YESTERDAY/i, (msg) ->
    msg.send robot.brain.data[MESSAGE_KEY] unless !robot.brain.data[MESSAGE_KEY]
    msg.send "CLEAR_MESSAGE"
