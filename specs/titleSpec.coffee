describe "Title Animation", ->
  it "after 6 iterations, count should == 0", ->
    demo.step()
    demo.step()
    demo.step()
    demo.step()
    demo.step()
    expect(demo.step()).toEqual 0