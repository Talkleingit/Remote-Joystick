


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
    <li><a href="#Architectural-pattern">The design architectural pattern</a></li>
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

* Emulator
* Flutter sdk
  ```sh
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Talkleingit/Remote-Joystick.git
   ```
2. Flutter
 ```sh
   https://flutter.dev/docs/get-started/install
```
   

<!-- Features-And-Functionality -->
## Features And Functionality



<!-- Architectural-pattern -->
## The design architectural pattern
 MVVM 
 
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
