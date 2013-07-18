window.demo =
  step: ->
    demo.title.classList.remove "step#{demo.count}"

    if demo.count >= 5
      demo.count = 0
    else
      demo.count++

    demo.title.classList.add "step#{demo.count}"

    demo.count

  init: ->
    @title = document.querySelectorAll("h1")[0]
    @count = 0
    setInterval(demo.step, 150)

demo.init()
