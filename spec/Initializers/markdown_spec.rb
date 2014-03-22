describe "Markdown" do
  describe "SanitizedRenderer" do
    it "should add _nofollow to links" do
      text = "[example](http://example.com)"
      output = SanitizedRenderer.render text
      output.should == "<p><a href=\"http://example.com\" rel=\"nofollow\">example</a></p>\n"
    end

    it "should remove HTML and Javascript" do
      SanitizedRenderer.render("<span>test</span>").should == "<p>test</p>\n"
      SanitizedRenderer.render("<script src=\"test\">test</script>").should == "<p>test</p>\n"

    end
  end

  describe "MdRenderer" do
    it "should not add _nofollow to links" do
      text = "[example](http://example.com)"
      output = MdRenderer.render text
      output.should == "<p><a href=\"http://example.com\">example</a></p>\n"
    end
  end
end