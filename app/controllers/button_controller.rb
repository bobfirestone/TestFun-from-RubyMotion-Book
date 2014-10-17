class ButtonController < UIViewController
  def viewDidLoad
    super
    button = UIButton.buttonWithType(UIButtonTypeSystem)
    button.setTitle("Tap Me", forState:UIControlStateNormal)
    button.sizeToFit

    # There seems to be a working range of [0..154,9..86]
    button_origin = [0,100] # fail - example in book
    # button_origin = [0,86] # pass
    # button_origin = [0,87] # fail
    # button_origin = [0,8] # fail
    # button_origin = [0,9] # pass
    # button_origin = [155,9] # fail
    # button_origin = [155,86] # fail
    # button_origin = [154,86] # pass
    button.frame = [button_origin, button.frame.size]
    button.addTarget(self,
      action:'tapped',
      forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(button)

    @tapped = false
  end

  def tapped
    @tapped = true
    self.view.backgroundColor = UIColor.redColor
  end
end
