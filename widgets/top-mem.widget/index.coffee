command: "ps axo \"rss,pid,ucomm\" | sort -nr | head -n10 | awk '{printf \"%8.0f MB,%s,%s\\n\", $1/1024, $3, $2}'"

refreshFrequency: 5000

style: """
  bottom: 10px
  left: 620px
  color: #fff
  font-family: Helvetica Neue


  table
    border-collapse: collapse
    table-layout: fixed

    &:before
      content: 'mem'
      position: absolute
      right: 0
      top: -14px
      font-size: 10px

  td
    border: 1px solid #fff
    font-size: 24px
    font-weight: 100
    width: 120px
    max-width: 120px
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

  .wrapper
    padding: 4px 6px 4px 6px
    position: relative

  .col1
    background: rgba(#fff, 0.2)

  .col2
    background: rgba(#fff, 0.12)

  .col3
    background: rgba(#fff, 0.08)

  p
    padding: 0
    margin: 0
    font-size: 11px
    font-weight: normal
    max-width: 100%
    color: #ddd
    text-overflow: ellipsis

  .pid
    position: absolute
    top: 2px
    right: 2px
    font-size: 10px
    font-weight: normal

  ul
    font-size: 15px
    font-family: Optima
    width: 200px

  li
    list-style-type: none

  span.cpu
    width: 200px
    text-align: right

  span.mem
    color #aaa
    position: absolute
    left: 5.0em
"""


render: -> """
  <ul>
    <li class='col1'></li>
    <li class='col2'></li>
    <li class='col3'></li>
    <li class='col4'></li>
    <li class='col5'></li>
    <li class='col6'></li>
    <li class='col7'></li>
    <li class='col8'></li>
    <li class='col9'></li>
    <li class='col10'></li>
  </ul>
"""

update: (output, domEl) ->
  processes = output.split('\n')
  table     = $(domEl).find('ul')

  renderProcess = (cpu, name, id) ->
    "<div class='wrapper'>" +
      "<span class='cpu'>#{cpu}</span><span class='mem'>#{name}</span>" +
      #"<div class='pid'>#{id}</div>" +
    "</div>"

  for process, i in processes
    args = process.split(',')
    table.find(".col#{i+1}").html renderProcess(args...)
