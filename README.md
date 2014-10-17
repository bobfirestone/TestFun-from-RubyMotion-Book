# RubyMotion Book - Chapter 7 - Testing

The BottonController spec is failing when positioned according to the books instructions.

```` ruby
    # spec/button_controller_spec.rb

    describe "ButtonController" do
      tests ButtonController
      it 'changes color after tapping' do
        tap("Tap Me")
        controller.instance_variable_get("@tapped").should == true
      end
    end

````

After some experimentation the tap appears to be missing the button depending on where the button_origin is set.

```` ruby
    # app/controllers/button_controller.rb

    # There seems to be a working range of [0..154,9..86]
    button_origin = [0,100] # fail - example in book
    # button_origin = [0,86] # pass
    # button_origin = [0,87] # fail
    # button_origin = [0,8] # fail
    # button_origin = [0,9] # pass
    # button_origin = [155,9] # fail
    # button_origin = [155,86] # fail
    # button_origin = [154,86] # pass
````

What is going on here?
