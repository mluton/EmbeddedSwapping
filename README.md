Demonstration how to add a sub view to a view in an iOS application where the sub view is connected to a nib file.

Note, you can use a `UIView` object as a sub view but not a `UIViewController` object. First, create a `UIView` class. Unlike `UIViewController` subclasses you won't have the option to create a nib file to go along with it. This is fine. Create the nib file by itself as a separate step. Open the nib file and go to the Identity Inspector for the top-level view object. Change the custom class to the corresponding view class you just previously created. For this example, place a `UILabel` in the view and create an outlet for it in the corresponding view class. Now you can place this as a sub view in any view you want to and can change the label programatically as well.

    // Create an instance of UIView (FooView).
    FooView *fooView = [[[NSBundle mainBundle] loadNibNamed:@"FooView" owner:self options:nil] objectAtIndex:0];

    // Tell it where to go. Otherwise, it'll appear in the upper left corner.
    fooView.frame = CGRectMake(10, 150, 300, 90);

    // Modify the text of the label.
    fooView.fooLabel.text = @"Modified Label Text";

    // Actually add the subview.
    [self.view addSubview:fooView];

Using a nib file may be overkill if it contains nothing but a `UILabel` but you can image how a more complicated nib file might be used in a real application. Comments, Feedback, Suggestions: [Michael Luton](mailto:mluton@gmail.com)

MIT license.
