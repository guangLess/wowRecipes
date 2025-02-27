
> Summary: Include screen shots or a video of your app highlighting its features


https://github.com/user-attachments/assets/6ba46bb6-64e3-4540-8a37-d7be381b44d4 

<img width="300" alt="EmptyData" src="https://github.com/user-attachments/assets/a3fb631a-f086-4950-862b-1e85aac061a6" />
<img width="300" alt="AllServerRelatedError" src="https://github.com/user-attachments/assets/76785a6c-0568-49f6-8ace-ace7bb05b9dc" />

----
> focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

Started writing tests and building the Model and decoder simultaneously: Model, decoding the data to construct the model with the mock data. 
Then I build the network layer to get the data from the host `*/cloudfront*`, and the related error handling around it. 
After the above 2 steps seem solid, I created a Text view that shows server-side readable msg if there is an error.
https://github.com/guangLess/wowRecipes/blob/760336c99a45926b95bd2bfc48005b8e3e510e53/WowRecipes/Views/ContentView.swift#L26-L31 
https://github.com/guangLess/wowRecipes/blob/a839e71938a8d76595eb0a1978f0b839afceb4a0/WowRecipes/RecipeViewModel.swift#L14-L24
Then, I started building the UI elements, it is a combo between using preview of single data injection vs calling the API to get realtime data. 

> Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

5~6 hours in total. Half was a week ago, another half spent the last 2 days.
Getting the model and `Networklayer` with error handling was designed to be more standard, the UI layer was more like exploration and fun. 

> Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
1) Adding mal data and testing that to adding a filtered types UI. Since there is already a test for mock data, for the time, it will be more beneficial to add more features in this short.
2) I designed a protocol for EndPoint which is a structure pattern for EndPoints containing host and path, which could be composed into URLComp, then to test and etc.  Did not end up using it as much for mocking tests, etc. Focused on getting the modal presenter to work well.
   
> Weakest Part of the Project: What do you think is the weakest part of your project?

* Detail view is not built fully yet
* Not much coverage tests on APIClient.  
* Did not have time to run the instrument to monitor storage, memory, concurrency, etc
* Some of the UI comp could be turned into shared/reusable modifier styles. 

> Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

This is a really fun project to build. Love it. 

