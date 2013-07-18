describe "Title Animation", ->

  beforeEach ->
    affix "h1.step0"
    demo.init()

  it "after 1 iteration, count should == 1", ->
    expect(demo.step()).toEqual 1

  it "after 6 iterations, count should == 0", ->
    demo.step()
    demo.step()
    demo.step()
    demo.step()
    demo.step()
    expect(demo.step()).toEqual 0