# Examples of the use of 3D touch in Objective-C

This code contain examples of use of :

* Dynamic quick actions
* Peek and Pop (different views and *UITableViewController*), some contain peek quick actions
* Pressure sensitivity

## Video
[![Click or tap for watch the video](https://raw.githubusercontent.com/hunk/MediaDemo/master/Samples3D-ObjC/IMG_0792.PNG)](https://www.youtube.com/watch?v=Z1ZFbGimuYc)

The project is very basic, the base is a *UITabBarController* with 3 tabs.

## Quick Action

We have 3 different quick actions, each one open a different tab. the first two display a system icon, the three action show a custom image from the assets

## Peek and Pop

### Tab One
We have four views, each one have support for 3D Touch (the main view dont have support, press it and don't happen nothing)

#### First view
this only show Peek.

#### Second view 
Have support for Peek and Pop, in Pop adds the *UIViewController* to navigation hierarchy

#### Third view
Equal to second view and adds support for *UIPreviewAction* and *UIPreviewActionGroup*, the three first element handle delegate methods for communication between *UIViewContollers*, the first action change the background of view, the second add a *UIViewController* to navigation, the third action show a *UIAlertController*. the fourth action is a group of action. if you tap in this options show two new action.For the first element in group we make push of *UIViewController* to the navigation controller since the handler of *UIPreviewAction*.

For this *UIPreviewActions* use the different type of *UIPreviewActionStyle*

#### fourth view
In this view it has the same behavior as the third view, but for Pop action show another *UIViewController*

### Tab two

In this tab have a *UITableViewController* for the main controller, this view have support for Peek and Pop. nothing special here only pass the information (section and row) of the cell to the *UIViewControllerPreviewing*. the point here is know the cell from the pressure location

### Tab three

Here have a simple *UIView* inside the main view. here we use de touch events (touchesBegan, touchesMoved, touchesEnded, touchesCancelled) for draw a shadow on the view. the opacity of shadow depend of force of touch
