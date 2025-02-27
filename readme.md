
###### Summary: Include screen shots or a video of your app highlighting its features

----
> focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

Started writing tests and building Model and decoder simultaneously: Model, Decoding the data to constract model with the mock data. 
Then I build the network layer to get the data from the host `*/cloudfront*`, and the related error handling around it. 
After the above 2 steps seems solid, I created a Text view that shows server side readable msg if there is an error. https://github.com/guangLess/wowRecipes/blob/760336c99a45926b95bd2bfc48005b8e3e510e53/WowRecipes/Views/ContentView.swift#L26-L31 
Then, I started building the UI elements, it is a combo between using preview of single data injection vs calling the API to get realtime data. 

> Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

5~6 hours in total. Half was a week ago, another half spended the last 2 days.
Getting the model and `Networklayer` with error handling was designed to be more standard, the UI layer was more like exploration and fun. 

> Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
1) Adding mal data and test that to adding a filtered types UI. Since there is already test for mock data, for the time, it will be more benificial to add more features in this short.
2) I designed a protocol for EndPoint which is a structure pattern for EndPoints contains host and path which could be composed into URLComp, then to test and etc.  Did not end up using it as much for mocking tests, etc. Focosed on getting the the modle presentater work well.
   
> Weakest Part of the Project: What do you think is the weakest part of your project?
* Detail view is not build fully yet
* Not much coverage tests on APIClient.  
* Did not have time to run instrument to monitor run the app for storage, memory, concurency, etc
* Some of the UI comp could be turned into shared/reusable mondifyer styles. 

> Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

This is a really fun project to build. Love it. 

