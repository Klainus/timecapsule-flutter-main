# OpenApi Generator

This project use OpenApi Generator to automatically generate the api defined by BE.
DO NOT EDIT GENERATED FILES as the changes will disapear next time you regenerate the api.

## Setup
Make sure you have the openapi generator installed on your computer, or run the following to install it: 
```bash
brew install openapi-generator
```

## How to regenerate the api


### Workflow method
To generate the API automatically, a workflow in the backend repository can be set up that triggers the [api_generator.yaml](../.github/workflows/api_generator.yaml) workflow by sending a "schema_released" event to the frontend repository through repository_dispatch.

Modify the environment variables at the beginning of the workflow, add access tokens in the frontend repository with correct permissions as well as an access token in the backend repository with permission to trigger workflows in the frontend repository.

Workflow runs can also be triggered manually through workflow_dispatch (in the GitHub UI).

### Manual method
1. Download the open api file from swagger. Scroll to the top of your swagger documentation in a web browser and press the `/docs/openapi/` link to download the file
2. Open [packages/app_api/openapi_schema.yaml](../packages/app_api/openapi_schema.yaml) and replace it's content with the content of the downloaded file
3. Run `make api`

This will regenerate all files in the packages/app_api directory, format the code, and run the build runner. 
If any breaking changes have been made by BE you will get warnings/errors in your repositorys, but it's always a good idea to ask BE about changes to make sure nothing new is missed.

## Notes
Changes to generated files will disappear next time you regenerate the api, unless the file is added in `.openapi-generator-ignore`. This means that the file must be maintained manually and should be avoided if possible.

Since the api is generated it is not optimized for readability, but each endpoint is fully documented.

All names will match BE, so make sure you have consistent naming conventions across the domains, or change the name in your repository layers to better fit the App domain.