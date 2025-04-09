# f_book

A new My book application project.

Setup instructions:
The app have two list pages, All books and Favorite books.
You can click all books button that navigates to My Books page, there the list of books fetched from the api.
You can make the particular book as your favorite.
The favorite books are listed in favorite books page.
You can click the list card and view the particular book details.
In the book list, you can do favorite/Un favorite.

Architecture Used:(MVVM)
- Model
Represents the data and business logic.Deals with APIs, databases, or local storage.
Example: Book model, API service class, Drift database.
- View
The UI layer — what the user sees.Uses StatelessWidget or StatefulWidget.Displays data passed from the ViewModel.
Reacts to changes via Provider, Consumer, etc.
- ViewModel
Acts as a bridge between View and Model.Holds app state, processes logic, and updates UI.
Calls the Model to fetch/save data.Notifies the View when data changes (notifyListeners() in Provider).

Features Implemented:
Mvvm architecture,
Lazy loading,
Provider - State management,
Error handling, Network checking,
CatchedNetworkImage - for load images & handle error image.
Drift - for local storage (Only for favorite books list),

