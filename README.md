# AxiomTelecomAssignmentApp

# ArticleDemoApp

Create a mobile applica4on with a catalog page as following:
1. Catalog page will have a search area to filter mobile handsets.
2. Show all mobile handsets retrieved from backend.
3. Catalog page will have a basic design showing the main fields like picture, brand, and
price.
- Category tabs are based on different “brand” fields in response
- Search area will provide a search field for keywords plus filtering criteria for main fields like
brand, phone, price, sim, gps, and audio jack. 

# Content


 * Structure Overview
 * How To Run
 * Unit Testing and Coverage
 * App Features
 
 
 # Structure Overview
 
 * **Configurator**: Contains **MobileCatalogsConfigurator** files. Configurator intialize all clean archecture files. This part is optional we can do it view controller. I choose it because i feel it make more clean view controller. 
 * **Controller**: Contains **MobileCatalogsViewController** component. MobileCatalogsViewController is light weight controller. So they are extra files like **Datasources** will handle delegates
 
 * **Helpers**: Contains files like constant and customcontrol that are essential and very helpful. 
 
 * **Interactor**: Contains **MobileCatalogsInteractor** file. Interactor is handling all business logic and it is also working with viewcontroller and worker to populate required information into viewcontrollers 
 
 * **Models**: Contains **ResponseModel**, **RequetModel** and **ViewModels** files. 
 * **Presentor**: Contains **MobileCatalogsPresenter** file. Presentor is handling all presntation logic of viewcontrollers

  * **Storboard**: Contains **Main** storyboard and default **launchScreen**.
   
  * **WebApi**: WebiApi component is responsible for all network calls and cache of network calls. I have LRUCache which is using linklist as data structure
  * **Worker**: Worker is responsable for handling remote calling.

# How To run

To run the project just open AxiomTelecomAssignment.xcworkspace and click on the run button. Before running the project you need to install pods. As one of library required pods. So please install pods using terminal. https://github.com/onevcat/Kingfisher/wiki/Installation-Guide Follow this link to install pods

# Unit Testing and Coverage
To run unit test. Open .xcworkspace and click on Test navigator and press play button. For generating code coverage report we need to enable code coverage from edit scheme. Screen shot is attached for more clarification. 


<img width="909" alt="Screen Shot 2020-09-06 at 11 06 10 PM" src="https://user-images.githubusercontent.com/13622096/92333315-8f1c2080-f095-11ea-889e-db19f98fa78a.png">


To see the code coverage we need to go to report navigator and click on coverage.

<img width="902" alt="Screen Shot 2020-09-06 at 11 03 38 PM" src="https://user-images.githubusercontent.com/13622096/92333255-36e51e80-f095-11ea-8019-a7a47f93c67d.png">




# AppFeature
  *Clean Architecture 
  *AutoLayout
  



