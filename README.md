# Flutter Cricket Live Scores App

This repository contains a Flutter app that fetches live cricket scores from the [Cricket Data API](https://cricketdata.org/). The app displays real-time information about cricket matches, including the score, teams, league, and match status (comment). Users can switch between two sections: "Current Matches" and "CricScores" to access different sets of cricket data. This project utilizes various Flutter widgets and features, including FutureBuilder, RESTful API integration, ListView, Row and Column layouts, and both stateful and stateless widgets.

## Features
* Display real-time cricket match scores.
* Show information about teams, leagues, and match statuses.
* Toggle between "Current Matches" and "CricScores" sections.
* Utilize FutureBuilder for asynchronous data loading.
* Incorporate RESTful API calls to fetch cricket data.
* Implement UI layouts using ListView, Row, and Column widgets.
* Use both stateful and stateless widgets for a dynamic user interface.

## Prerequisites
Flutter and Dart SDKs installed. You can follow the installation instructions [here](https://docs.flutter.dev/get-started/install).

## Screenshots
For a live working demo of the app, please visit the following link: [Flutter Cricket Live Scores](https://drive.google.com/file/d/1_1YiLY7tKNTkQ4qPX_MbB-AFEiHHSNP3/view?usp=sharing)

* Current Matches:

![1](https://github.com/ParasPalli/Live_Cricket_Score_App/assets/115391909/988b24cb-5325-46c7-b215-5951eadca8a7)

* Cric Scroces:

![2](https://github.com/ParasPalli/Live_Cricket_Score_App/assets/115391909/7872d60e-1dca-4c61-88de-489d101e4c51)

## API Integration
The app integrates with the Cricket Data API to fetch real-time cricket scores and match details. The CricketApi class in the services directory handles API requests and responses.

## Flutter Widgets
* **FutureBuilder**: Used for asynchronous data loading from the API.
* **ListView**: Displays a scrollable list of cricket scores.
* **Row and Column**: Arrange UI elements in a structured layout.
* **Stateful and Stateless Widgets**: Manage dynamic and static parts of the user interface.
