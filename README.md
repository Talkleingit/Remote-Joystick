


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#Features-And-Functionality">Features And Functionality</a></li>
    <li><a href="#The-API">The API</a></li>
    <li><a href="#The-Client-Side">The Client Side</a></li>
    <li><a href="#The-Algorithm-Server">The Algorithm Server</a></li>
    <li><a href="#UML">UML</a></li>
    <li><a href="#User-Stories-Video">User Stories Video</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project







### Built With






<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these steps.

### Prerequisites

* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Talkleingit/Remote-Joystick.git
   ```
2. https://flutter.dev/docs/get-started/install

   
   ```

<!-- Features-And-Functionality -->
## Features And Functionality


Firstly, the user uploads a csv file to be trained and also specifies which type of algorithm (hybrid/regression) needs to be used by the 
algorithm server. After the train file is uploaded the user is presented with a notice that a new model has been created, and the time of creation
is also specified. At this point, the csv file's data is presented visually in a graph to the user. The user is able to select a feature, in a drop-down menu, and the relevant data will be presented on the graph - in which the Y axis contains values of the selected feature, and the X axis is time.
The user can then upload yet another file containing possible anomalies. The data is processed by the API and passed
to the algorithm server for anomaly detection. When the detection is done the algorithm server sends back a message that contains a list of spans for each 2 correlated features.
The spans are in the format of [start,end] where start is the first line and end is the line after the last line in which the anomalies were found. This list of lines
is passed to the client side to be presented to the user. Moreover, the information concerning the anomalies is presented graphically in the website. At this point, the user is able to select a feature in the drop-down menu, and the graph will get updated - the X axis will represent the selected feature's values, and the Y axis will represent values of the selected feature's most correlated feature. The points which are considered anomalies will be colored in red, and the user has the option to show or hide them and the regular points.





![pending](https://user-images.githubusercontent.com/72923818/119162286-dc44f480-ba62-11eb-9575-d7b7b24a1648.jpg)

![tooltip](https://user-images.githubusercontent.com/72923818/119162510-21692680-ba63-11eb-8421-9ad289961e8b.jpg)


<!-- The-API -->
## The API

* POST api/model  - This path expects a query parameter containing the model type and the data in the body. The data sent in the body is trained by the algorithm server. After that a new model is created that contains a unique ID for this model, the exact time the model was created, the type of algorithm that the model was trained with, and the features that were trained.
* GET api/model   - This path expects a query parameter containing the unique model ID. It sends back the trained model saved in the database.  
* DELETE api/model  - This path expects a query parameter containing the unique model ID. It deletes the model from the database.
* GET api/models  - This path sends all the models that were trained and saved in the database. 
* POST api/anomaly   - This path expects a query parameter containing the unique model ID and the data in the body. The data given in the body is sent to the algorithm server for anomaly detection. It sends back the spans calculated by the algorithm.

<!-- UML -->
## The Client Side

The website is built with react. Each component has its own responsibility and thus we've kept OOP principles throughout the project. The site is built in way that with each render of the site the model's status updates (if a model was trained previously, its status would be pending and after the next rendering of the site it will change to ready). In addition, each request from the user is translated into an API request for the API server. The client processes the input csv files given by the user (a train file or a file with possible anomalies) and parses them into useable data for the API and sends the data to the server. Once the results from the API server return the client presents them to the user graphically. If any anomalies were found the user can observe them in the graph (they are colored in red) and the lines in the table that are lines that were stated in the spans are colored in red as well. Moreover, any request or update is followed by a notification in order to keep the user informed of any change in the data.  
<!-- The Algorithm Server -->
## The Algorithm Server

This server detects anomalies with two different algorithms. The server receives CSV files both for the learning part and the detection part.
The algo server contains a few parts:
Server- receives and sends data from and to clients that has connected with the program.
Algo- the algorithms find, based on the ‘train’ CSV, the correlation between the CSV features and calculate the anomalies points bases on the ‘test’ CSV. The data is received and the ‘learn normal’ finds the correlated features in the CSV, each correlated feature is saved. The ‘detect’ finds the points in the ‘train’ CSV that are not suited for the correlation that was found during the ‘learn’.
The anomaly points are saved, and the client can ask for both list of the points or span of them. The span is calculated that points that are closed together will be featured as one.
In this project there are two algorithms that find the correlation and find anomalies. The first algorithm is a line regression algorithm and the second is a Hybrid algorithm. Both algorithms can be used.
The data that is received is in CSV format, the Parser extracts the relevant data from the file and saves it for further use by the algorithms.

<!-- UML -->
## UML



![UML](https://user-images.githubusercontent.com/72923818/119130472-f79f0800-ba40-11eb-81e2-4ddcb06713fc.jpg)





<!-- User-Stories-Video -->
## User Stories Video

https://github.com/or-gottman/AnomalyDetectionWebApp/blob/master/DEMO.mp4



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/github_username
