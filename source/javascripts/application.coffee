#= require jquery/dist/jquery.js
#= require fastclick/lib/fastclick.js
#= require foundation/js/foundation/foundation.js
#= require waypoints/lib/jquery.waypoints.js
#= require waypoints/lib/shortcuts/sticky.js

$ ->
  FastClick.attach document.body

  if $(window).width() > 1024
    $aside = $('#aside')
    $content = $('#content')
    new Waypoint.Sticky
      element: $aside[0]

    asideHeight = $aside.height()
    contentHeight = $content.height()
    offset = -contentHeight+asideHeight
    $content.waypoint
      offset: offset
      handler: (direction)->
        if direction == 'down'
          $aside.css
            top: (-offset) + 'px'
            position: 'absolute'
            left: 0
            right: 0
        else
          $aside.attr 'style', ''
