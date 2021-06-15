commands =
  active : "/usr/local/bin/yabai -m query --spaces --space | /usr/local/bin/jq '.index'"
  list   : "/usr/local/bin/yabai -m query --spaces | /usr/local/bin/jq -r '.[].label'"
  monitor: ""

colors =
  acqua:   "#00d787"
  wine:    "#72003e"
  orangeold:  "#ff8700"
  silver:  "#e4e4e4"
  elegant: "#1C2331"
  magentaold: "#af005f"
  cyanold:    "#00afd7"
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
          "$(#{commands.active}):::" +
          "$(#{commands.list}):::"

refreshFrequency: 10000000

render: () ->
  """
  <link rel="stylesheet" href="./polybar/assets/font-awesome/css/all.css" />
  <div class="spaces">
    <div>1: Default</div>
  </div>
  """

update: (output) ->
  output = output.split( /:::/g )

  active = output[0]
  list   = output[1]

  @handleSpaces(list)
  @handleActiveSpace(Number (active))

handleSpaces: (list) ->
  $(".spaces").empty()
  list = " " + list
  list = list.split(" ")

  $.each(list, (index, value) ->
    if (index > 0) 
      faIcon = switch
        when value ==  'web' then "fab fa-firefox-browser"
        when value == 'code' then "fa fa-code"
        when value ==  'term' then "fa fa-terminal"
        when value ==  'conf' then "fa fa-phone"
        when value ==  'chat' then "fa fa-comment"
        when value ==  'cal' then "fa fa-calendar"
        when value ==  'mail' then "fa fa-envelope"
        when value ==  'todo' then "fa fa-list-ul"
        when value ==  'music' then "fa fa-music"
        when value ==  'misc' then "fab fa-apple"
      $(".spaces").append(
         """
         <div class="workspace" id="#{index}">
         #{index}:
         <i class=\"#{faIcon} \"></i>
         #{value}</div>
         """
      )
    
      #$("<div>").prop("id", index).text("#{index}: #{value}").appendTo(".spaces")
  )

handleActiveSpace: (id) ->
  $("##{id}").addClass("active")

style: """
  .spaces
    display: flex
    align-items: stretch
    height: 24px

  .workspace
    text-transform: capitalize
    display: flex
    color: #{colors.blue}
    align-items: center
    justify-content: center
    padding: 0px 12px

  .fa, .fab
   padding-right: 5px 
   padding-left: 5px
   //font-size: 0.80rem
   //background: red

  .active
    color: #{colors.red}
    background: #{colors.fg_gutter}
    border: 0px solid #{colors.orange}

  top: 0px
  left: 24px
  font-family: 'Monaco'
  font-size: 14px
  font-smoothing: antialiasing
  z-index: 0
"""
