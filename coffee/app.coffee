window.demo =
  title: document.querySelectorAll("h1")[0]
  count: 0

  step: ->
    demo.title.classList.remove "step#{demo.count}"

    if demo.count >= 5
      demo.count = 0
    else
      demo.count++

    demo.title.classList.add "step#{demo.count}"

    demo.count

setInterval(demo.step, 150)
