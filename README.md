# WhatsAppAPI
Framework WhatsAppAPI

 - Step 1: Open your project
 - Step 2: Now that we have our Project opened, we can drag in the WhatsAppAPI.xcodeproj

When you are dragging in the WhatsAppAPIFramework make sure that you don't have another instance of Xcode open. When I tried to drag the framework in with multiple instances of Xcode it wouldn't work properly. Once you have dragged in the framework it should have a little arrow next to it which will allow you to see the contents of that framework.

 - Step 3: Add the framework to Frameworks, Libraries and Embedded Content
 
To do this you will need to click on the [ProjectApp] project in the top left, go to the General tab and then look for Framework, Libraries and Embedded Content. Once you have found it, click on the + button.

When you click on the + button you will get prompted to choose the framework you want to add.

Make sure to select the WhatsAppAPIFramework.framework as it is in the above image.

- Step 4: Use the framework

Now that we have everything setup we can use the framework. I am going to use it in the viewDidLoad in my ViewController file in MainApp.
Add the following import to the top of the file, below import UIKit:
```
import WhatsAppAPI
```
Next we need to update the viewDidLoad. Replace your current viewDidLoad with the following:
```
override func viewDidLoad() {
    super.viewDidLoad()
    let whatsapp = WhatsApp() //Framework
    whatsapp.log(message: "whatsapp initialized")
   
}
```
You should now be able to build and run the app. When you do, it will print out Log message: whatsapp initialized.

