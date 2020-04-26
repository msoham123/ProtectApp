# Protect

Hackathon Project
Created by Soham Manoli and Aryan Vichare
Link to Project Pitch: https://youtu.be/nhw6XkmbE2g

## Inspiration

Amidst the global COVID-19 pandemic we noticed that there wasn't a central area to alleviate the stress and anxiety people have of the coronavirus, prevent the spread of the virus, present reliable statistics and news of the virus in one central area, and build a community of people to fight against the global pandemic. 

## What it does

Protect is designed to provide access to on-demand information and powerful tools to make a difference. We built a backend system for login and signup using Firebase Authentication that securely authenticates users into the platform using password encryption. Protect provides general information on keeping safe, quick and simple access to reliable and relevant news, and real-time statistics from an API by calling an HTTP ‘GET’ request over the network. In addition, Protect has an integrated PayPal and Credit Card system so you can donate to leading organizations that have pledged to support your issue and research facilities. We have also integrated two extremely useful tools. The first tool is a Bluetooth contact tracing system. If two people are within 6ft of each other, their phones automatically exchange unique codes (known as a TCN) via Bluetooth. If a person tests positive for the coronavirus, they have the option to log vital information to the database such as, the date they started to feel the symptoms, the date they got tested, their location information, and the public key. The app will periodically check the codes it received and determine if one or more codes were from the person who tested positive for the coronavirus. If so, an alert will be sent to all the devices who were in contact with the person infected. The second tool is a novel way to self-assess if you are vulnerable to COVID-19. COVID-19 is especially deadly for those who have problems with their respiratory system. We trained a Deep Convolutional Neural Network on top of the MobileNet architecture by using Transfer Learning. We built the model using AWS Sagemaker. With over 90% accuracy, our model feeds in an X-Ray image and classifies whether the user has normal, viral, or bacterial pneumonia. The image is sent over the network to our RESTful API built with the Flask microservice and returns the prediction by first loading the model from AWS S3 buckets and then using the model to predict and return raw JSON data back to our app using Bi-Directional Streaming. 

One of our primary focuses for Protect is the community because we believe that relationships can solve problems. These relationships can stem into powerful movements, fueled by change. Protect pushes users to develop a community through challenges. Every time a user completes a challenge, they get points and can post their progress via images or written stories on the integrated feed. The user can also post pictures of events, work they’ve done for the cause, and important information on the feed. All data entered through the posts form is persisted in Google’s Cloud NoSQL database, Cloud Firestore, and Firebase Storage for all the images. By using the power of Firebase Cloud Firestore and Data Streaming we have included chat rooms for each topic. Chat rooms allow users to network with each other and discuss potential solutions. In addition, 

Protect also has a video chat feature built with Agora.io that enables quick and flawless face to face connections with people around the world. This feature can also be used for doctors and patients worldwide to seamlessly communicate while staying at the luxury of their homes and practice social distancing. Other coronavirus apps don’t have the networking and communication infrastructure that we have built into Protect.

## How we built it

Our app can be divided into two separate components namely the app itself and the flask webserver. Our app was built using Flutter and Dart for the UI/UX, firebase authentication, firebase cloud firestore, and firebase cloud storage for the backend and database. 

## Challenges we ran into

One big challenge that we ran into was integrating the machine learning with our app. We initially tried to use the tflite package, but that ended up causing various conflicts with other packages we were already using such as firebase and agora.io. As a result, we ended up making our own flask web server with an endpoint to upload an image to the server. This was really convenient because the machine learning predictions would happen on the server-side and the server would only return the model's prediction and percent accuracy. Another challenge was building the communication infrastructure such as the messaging channels, video calling, and posts feature. We had to learn how to use firebase storage to persist all our user data efficiently and securely. In addition, building the Bluetooth contact tracing system was also a challenge because of the limited documentation available. After a ton of R&D, we managed to build a really robust way of preventing the spread of the coronavirus using Bluetooth technology. 

## Accomplishments that we're proud of

We are really proud to have created a fully functional cross-platform app that alleviates the stress and anxiety people have of the coronavirus, prevents the spread of the virus, presents reliable statistics and news of the virus in one central area, and builds a community of people to fight against the global pandemic. 

## What we learned

We entered this hackathon with no prior experience using many technologies such as Firebase Storage, AWS Sagemaker, AWS S3 buckets, and Agora.io, but with a ton of hard work and dedication, we were able to complete making Protect! 

## What's next for Protect

We hope to release our app to the App Store and Google Play Store for people to use. We designed our app so that it is extensible to other global issues. COVID-19 isn't the only issue although it is at the forefront of everyone's mind. We plan to add new "Protect's" in the future that addresses issues such as education in third world countries, poverty, food and hunger, water and sanitation, the environment, and many others.

## How to Install Protect - Android

Install Using Github: 
1. Follow the Flutter installation guide from https://flutter.dev/docs/get-started/install 
2. Clone this git repository
3. Open the directory in IntelliJ, VS CODE, or Android Studio (https://flutter.dev/docs/get-started/editor?tab=androidstudio"
4. Configure the Dart SDK
5. Click on the banner `packages get` or run `flutter packages get` in the terminal.
6. Conigure any Android Frameworks if neccessary by selecting the configure frameworks popup.
7. Go to the `devices` tab and make sure your device is selected.
8. Click on the green button and `run` the app.
9. You should see `Running Gradle task 'assembleDebug'`.
10. Login with the credentials: 
* email: `msoham123@gmail.com`
* password: `msoham123`

Install via APK:
1. Download the APK from https://drive.google.com/file/d/1fQxN9892JmeRWLiZT1QYK1cQ2SuoeutJ/
2. Open it using the Package Installer and install the app.
3. Run the app!
4. Login with the credentials: 
* email: `msoham123@gmail.com`
* password: `msoham123`
