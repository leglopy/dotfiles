commands =
  battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
            "| cut -f1 -d';'"
  charging: "pmset -g batt | grep -c 'AC'"
  time   : "date +\"%H:%M:%S\""
  wifi   : "/System/Library/PrivateFrameworks/Apple80211.framework/" +
            "Versions/Current/Resources/airport -I | " +
            "sed -e \"s/^ *SSID: //p\" -e d"
  date   : "date +\"%a %d %b\""
  volume : "osascript -e 'output volume of (get volume settings)'"
  input : "osascript -e 'input volume of (get volume settings)'"
  cpu    : "ESC=`printf \"\e\"`; ps -A -r -o %cpu | awk '{s+=$1} END {printf(\"%05.2f\",s/8);}'"
  disk   : "df -H -l / | awk '/\\/.*/ { print $5 }'"

colors =
  # black   : "#3B4252"
  gray    : "#5C5C5C"
  # red     : "#BF616A"
  # green   : "#A3BE8C"
  # yellow  : "#EBCB8B"
  # blue    : "#81A1
  # magenta : "#B48EAD"
  # cyan    : "#88C0D0"
  white   : "#D8DEE9"
  # acqua:   "#00d787"
  # wine:    "#72003e"
  # orangeold:  "#ff8700"
  # silver:  "#e4e4e4"
  # elegant: "#1C2331"
  # magentaold: "#af005f"
  # cyanold:    "#00afd7"
  bg_dark: "#1f2335"
  bg: "#24283b"
  bg_highlight: "#292e42"
  terminal_black:  "#414868"
  fg: "#c0caf5"
  fg_dark: "#a9b1d6"
  fg_gutter: "#3b4261"
  dark3: "#545c7e"
  comment: "#565f89"
  dark5: "#737aa2"
  blue0: "#3d59a1"
  blue: "#7aa2f7"
  cyan: "#7dcfff"
  blue1: "#2ac3de"
  blue2: "#0db9d7"
  blue5: "#89ddff"
  blue6: "#B4F9F8"
  blue7: "#394b70"
  magenta: "#bb9af7"
  purple: "#9d7cd8"
  orange: "#ff9e64"
  yellow : "#e0af68"
  green : "#9ece6a"
  green1 : "#73daca"
  green2 : "#41a6b5"
  teal : "#1abc9c"
  red : "#f7768e"
  red1 : "#db4b4b"

command: "echo " +
          "$(#{commands.battery}):::" +
          "$(#{commands.charging}):::" +
          "$(#{commands.time}):::" +
          "$(#{commands.wifi}):::" +
          "$(#{commands.volume}):::" +
          "$(#{commands.input}):::" +
          "$(#{commands.date}):::" +
          "$(#{commands.cpu}):::" +
          "$(#{commands.disk}):::"

refreshFrequency: 10000

render: () ->
  """
  <link rel="stylesheet" href="./polybar/assets/font-awesome/css/all.css" />
  <div class="elements">
    <div class="input">
      <span>
        <span class="mic-icon"></span>
        <span class="volume-input"></span>
      </span>
    </div>
    <div><span class="spacer">|</span></div>
    <div class="volume">
      <span>
        <span class="volume-icon"></span>
        <span class="volume-output"></span>
      </span>
    </div>
    <div><span class="spacer">|</span></div>
    <div class="cpu">
      <span>
        <i class="fa fa-microchip"></i>
        <span class="cpu-output"></span>
      </span>
    </div>
    <div><span class="spacer">|</span></div>
    <div class="disk">
      <span>
        <i class="fa fa-hdd"></i>
        <span class="disk-output"></span>
      </span>
    </div>
    <div><span class="spacer">|</span></div>
    <div class="wifi">
      <span>
        <i class="fa fa-wifi"></i>
        <span class="wifi-output"></span>
      </span>
    </div>
    <div><span class="spacer">|</span></div>
    <div class="battery">
      <span>
        <span class="battery-icon"></span>
        <span class="battery-output"></span>
      </span>
    </div>
    <div><span class="spacer">|</span></div>
    <div class="date">
      <span>
        <span class="date-output"></span>
        <span class="time-output"></span>
      </span>
    </div>
  </div>
  """

update: (output) ->

  #console.log(output)
  output = output.split( /:::/g )

  battery  = output[0]
  charging = output[1]
  time     = output[2]
  wifi     = output[3]
  volume   = output[4]
  input    = output[5]
  date     = output[6]
  cpu      = output[7]
  disk     = output[8]

  inputMic = if(input > 0) then "#{input}%" else inputMic = "";

  $(".battery-output") .text("#{battery}")
  $(".time-output")    .text("#{time}")
  $(".wifi-output")    .text("#{wifi}")
  $(".volume-output")  .text("#{volume}%")
  $(".volume-input")  .text("#{inputMic}")
  $(".date-output")    .text("#{date}")
  $(".cpu-output")     .text("#{cpu}%")
  $(".disk-output")    .text("#{disk}")

  @handleBattery(Number(battery.replace( /%/g, "")), charging == '1')
  @handleVolume(Number(volume))
  @handleInput(Number(input))

handleBattery: ( percentage, charging ) ->
  if charging
    $(".battery-icon").html("<i class=\"fas fa-bolt \"></i>")
    return

  batteryIcon = switch
    when percentage <=  12 then "fa-battery-0"
    when percentage <=  25 then "fa-battery-1"
    when percentage <=  50 then "fa-battery-2"
    when percentage <=  75 then "fa-battery-3"
    when percentage <= 100 then "fa-battery-4"

  $(".battery-icon").html("<i class=\"fa #{batteryIcon} \"></i>")



handleVolume: (volume) ->
  volumeIcon = switch
    when volume ==   0 then "fa-volume-off"
    when volume <=  50 then "fa-volume-down"
    when volume <= 100 then "fa-volume-up"
  $(".volume-icon").html("<i class=\"fa #{volumeIcon}\"></i>")

handleInput: (input) ->
  micIcon = switch
    when isNaN(input) then "fa-microphone-slash"
    when input == 0 then "fa-microphone-slash"
    when input <= 100 then "fa-microphone"
  $(".mic-icon").html("<i class=\"fa #{micIcon}\"></i>")


style: """

  .elements
    display: flex
    align-items: stretch
    height: 24px
    margin: 0 4px

  .elements > div
    display: flex
    align-items: center
    padding: 2px 2px
    margin: 0px auto

  .spacer
    color: #{colors.comment}

  .battery
    color: #{colors.dark5}
  .time
    color: #{colors.white}
  .wifi
    color: #{colors.dark5}
  .volume
    color: #{colors.dark5}
  .date
    color: #{colors.white}
  .volume
    color: #{colors.dark5}
  .input
    color: #{colors.dark5}
  .cpu
    color: #{colors.dark5}
  .disk
    color: #{colors.dark5}

  top: 0px
  right: 24px
  font-family: 'Monaco'
  font-size: 14px
  font-smoothing: antialiasing
  z-index: 0
"""
