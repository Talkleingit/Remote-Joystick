
<!-- Title -->
## Remote joystick for Flight gear simulator



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
    <li><a href="#The-design-architectural-pattern">The design architectural pattern</a></li>
    <li><a href="#UML">UML</a></li>
    <li><a href="#Application-Pictures">Application-Pictures</a></li>
    <li><a href="#User-Stories-Video">User Stories Video</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
This is an android application project written entirely in dart with the use of flutter. The project provides a friendly to use android application in which the user
can connect to the Flight gear application and control the planes' joystick and speed.





### Built With
1. Dart
2. Flutter





<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these steps.

### Prerequisites

* Emulator
* Flutter sdk - https://flutter.dev/docs/get-started/install
  ```sh
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Talkleingit/Remote-Joystick.git
   ```
2. Run an android emulator
 ```sh
```
3. Run these commands in the terminal (in the project folder)
 ```sh
   $ flutter packages get
   $ flutter run --no-sound-null-safety
```
   

<!-- Features-And-Functionality -->
## Features And Functionality



<!-- The-design-architectural-pattern -->
## The design architectural pattern
 The architectural design pattern used in this project is the MVVM design. In the lib directory there are 3 sub-directories: 
 ### 1. Model:
  This directory contains the Model.dart file which contains the business logic. The model is in charge of connecting over a socket using an IP and port to the Flight gear
  app. The connection to the Flight gear is done through a thread pool, meaning each time the model sends data to the Flight gear application the thread pool schedules the same   task that executed the last task and thus there is no need to create a new isolation each time. Moreover, the model sends the correct messages to the Flight gear according to   the Api Flight gear provided.  
 ### 2. View:
  This directory contains all the view files. In the directory each main widget that is used in the application is defined in a seperate file (there are 2 sub directories in
  this directory for the sliders (throttle slider, rudder slider) and for the text fields. Moreover, there is a Joystick.dart file for the joystick used in the application. 
  The joystick is not dependent on the ViewModel or any other file in the project for that matter, instead it is a stand alone component that can be easily integrated into 
  another project. The joystick contains a callable property named onChangeLogic, in runtime this property is initialized with any callable object that accepts 2 double 
  parameters. In this project the callable object given at runtime commands the ViewModel to update the rudder and elevation parameters.
  ### 3. ViewModel:
  This directory contains the ViewModel.dart file. The ViewModel is in charge of sending commands to the Model whenever the view is changed. Meaning, for example if the user 
  moved the joystick, the onChangedLogic function in the joystick (injected at runtime) will command the ViewModel to set the new rudder and elevator values, and thus the 
  ViewModel will command the Model to send the new values to the Flight gear. With this sort of methodolgy we've maintained a clear seperation between the View and Model. The 
  chain event starts at the view continues to the ViewModel and ends at the Model.
  
 
<!-- UML -->
## The Client Side

 
<!-- The Algorithm Server -->

<!-- UML -->
## UML


<!-- Application-Pictures -->
## Pictures of the application
![image](https://user-images.githubusercontent.com/72923818/122303620-7dad5200-cf0c-11eb-9e0a-1949e801a92b.png)





<!-- User-Stories-Video -->
## User Stories Video





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
