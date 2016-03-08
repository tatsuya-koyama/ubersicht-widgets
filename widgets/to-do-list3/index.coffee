refreshFrequency: 60000

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/Desktop/go/want_todo.txt'

command: "cat #{todolistfile} | awk 'BEGIN {print \"<ol>\"} /^[-]/ {print \"<li>\"substr($0,2)\"</li>\"} /^[+]/ {print \"<li class=\\\"completed\\\">\"substr($0,2)\"</li>\"} END {print \"</ol>\"}'"

style: """
  top: 203px
  left: 1050px
  color: #fff
  font-family: Helvetica Neue

  h
    color: #fff
    display: block
    text-align: left
    padding-left: 1.0em
    font-size: 24px
    font-weight: 100

  div
    display: block
    text-shadow: 2px 2px 5px rgba(#000, 1.0)
    font-size: 16px

  ol
    padding-left: 20px
    line-height: 180%

  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <h>Want ToDo</h>
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)
