## Description
This project is closely integrated with the Django boilerplate developed by App Shacks’ backend team. We usually create new projects using both templates, and we aim for everything to work from the get-go.  
When developing, it can, therefore, be good to spin up the Django boilerplate in a local docker container to be able to interact with the API. 

## Setup

1. Checkout the [Django Blilerplate](https://github.com/app-shack/as-boilerplate-flutter) with Git.
2. In the root of the Django Boilerplate repo, create a new file called `.env` and add the following:
```
ENV=LOCAL
DEBUG=True

DB_PASSWORD=supersecret
SECRET_KEY=loremipsumdolorsitamet
ALLOWED_HOSTS=localhost,127.0.0.1,10.0.2.2
```
3. Make sure you have docker installed otherwise install it by running the following bash command:  
```bash
brew install --cask docker 
```
4. Start docker desktop (from the terminal or through your applications folder) and verify that the docker logo is visible in your MacBooks toolbar.
5. To build the image and run it, you can use the convenience command in the Django boilerplate.  Navigate to the root of the Django Boilerplate and run the following in the terminal:
```bash
make run
```
6. Now, we have to add a user to the database in order to log in to the app and authenticate the user.  
In the MakeFile, there is another command for this:
```bash
make createsuperuser email=tester@gmail.com
```  
You should now be able to go to your browser, enter the admin page via [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/), and log in as your new superuser.   

7. To access the API from the Android emulator, we must set the base URL to Androids proxy to your local machine, which is `http://10.0.2.2:8000`. Go to the main file for the environment you are working on, for example, `main_development.dart`, and add this as your base URL:  
[main_development.dart](../lib/main_development.dart)
```dart
Future<void> main() async {
  await bootstrap(
    debug: true,
    debugPrint: debugPrint,
    environment: 'development',
    baseUrl: 'http://10.0.2.2:8000',
  );
}
```
8. (optional) If you want to make sure that the app is running the latest version of the api you can go to the [Swagger docs](http://127.0.0.1:8000/docs/) and press the `/docs/openapi/` hyperlink in the upper left corner. This will download the current API as an openapi file.  
To regenerate the API with the latest changes, follow the steps in [api_generation.md](api_generation.md).

##

Now, you should be able to run the app in the emulator and communicate with the backend like you normally would with any other API.

