Demonstration of how to make a custom container view controller manage multiple child view controllers using storyboards. This solution is heavily based on [Peregrin Planet's Container View Controllers in the Storyboard](http://orderoo.wordpress.com/2012/02/23/container-view-controllers-in-the-storyboard/).

The child view controllers are connected to their container with a custom segue. The custom segue doesn't do anything but exists for the purpose of connecting things together in the storyboard. The custom container view controller manages the child view controllers in `prepareForSegue:sender`. 

```objective-c
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:SegueIdentifierFirst])
    {
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
        }
        else {
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond])
    {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
    }];
}
```

See the [blog post](http://sandmoose.com/post/35714028270/storyboards-with-custom-container-view-controllers) for a more detailed description. Download the full project for the complete solution. Comments, Feedback, Suggestions: [Michael Luton](mailto:mluton@gmail.com)

MIT license.
