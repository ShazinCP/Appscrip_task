# User List App 

This app displays a list of users fetched from a public API. It shows users' names and email addresses in a list view. Users can refresh the list, search for specific users by name, and tap on a user to view more details. The app also handles errors gracefully and includes several additional features to enhance user experience. 

### Features: 

- Display shimmer effect while loading. 
- Show a list of users with their name and email address.
- Display a loading indicator while fetching data.
- Pull-to-refresh functionality to refresh the list of users.
- Error handling for failed API requests.
- Search functionality to filter users by name.
- Detail screen to show more information about a user when an item in the list is tapped.
- Custom widgets to organize code better.
- Display user avatars.


 ## Instructions on How to Run the App
 
- Clone the repository:   https://github.com/ShazinCP/Appscrip_task.git
- Install dependencies:  flutter pub get
- Run the app:  flutter run

## Assumptions or Decisions Made During Development 

- API Choice: The app fetches data from a publicly available API. The specific API chosen is https://jsonplaceholder.typicode.com/users for demonstration purposes.
- State Management: Chose Provider for state management due to its simplicity and effectiveness for this app's requirements.
- Design: Followed Material Design principles for UI components.
- Error Handling: Implemented basic error handling to show messages for network failures or API errors.

## Screenshots 

### Home Screen 
<img src="https://github.com/user-attachments/assets/af2f4022-66e1-4efe-89bf-314f5be14720" alt="Home Screen" width="200"> 

### User Details 
<img src="https://github.com/user-attachments/assets/a4802746-71fc-4db2-acad-901d6caf0295" alt="User Details" width="200">
