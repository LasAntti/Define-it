# Define-it
This is a dictionary application, in which you can see definitions for random words, or look up a word of your choice. This application is made using Flutter/Dart, as the final assignment for a Web-Hybrid development course at school. 

<img src="https://user-images.githubusercontent.com/100110572/221351567-45b44b23-8b47-4f7a-a5ba-9df9c4732201.jpg" width="340" height="570">    <img src="https://user-images.githubusercontent.com/100110572/221351564-223de35e-ed9d-49d1-bf04-67e657a0f26d.jpg" width="340" height="570">



# Setting up
1. Clone repository
2. Run 'flutter pub get'
3. This application uses 2 APIs, WordsAPI : https://www.wordsapi.com/ , and Unsplash API: https://unsplash.com/developers. ***You will need to have a registered account with both of these APIs, in order to get API keys***. Both have free plans available, but WordsAPI still requires a payment card of some sort.
4. After getting keys for both of these APIs, you will need to copy/paste them in to lib/http/get_word.dart (for the WordsAPI) and lib/http/get_image.dart (for Unsplash API).

Unsplash API allows you to make 50 requests/hour in their free plan, while WordsAPI allows for 2500 requests/24h (as of February 2023). 

# Packages/Dependencies

1. https://pub.dev/packages/speech_to_text, used if user wants to use device microphone to search for a word.
2. https://pub.dev/packages/hive, used to store saved words and their definitions, also user preferences (only option present for user is dark/lightmode option). 
3. https://pub.dev/packages/url_launcher, used to launch userprofile at Unsplash of the photographer on background images.
4. https://pub.dev/packages/http, to make API requests. 

