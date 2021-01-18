#  Fintech

Portfolio application created to pass the selection process. This challenge is about creating an app capable of displaying the data obtained through a provided endpoint in the required way.

| Dashboard | Profile |
|--------------|---------------|
| ![Clean Architecture](https://user-images.githubusercontent.com/14141324/104879445-25beef00-595e-11eb-827c-a375f1b48800.PNG) | ![Clean Architecture](https://user-images.githubusercontent.com/14141324/104879488-38d1bf00-595e-11eb-9765-e17af8d21dde.PNG)|


## Architecture

The app is built according to the principles of Clean Architecture, Clean Code and SOLID.

These principles allow us to decouple the project into different layers (Presentation, Domain and Data), which provides better testability of the components, as well as improves control over the scalability of functionalities without losing control of the project.

The applied architecture is designed to be highly testable.

Dependency injection is implemented from the SwiftUI lifecycle.

![Clean Architecture](https://user-images.githubusercontent.com/14141324/104879300-e2648080-595d-11eb-81e3-1716c6d09038.jpg)


## Presentation layer

This layer implements the MVVM + SwiftUI pattern.

On the presentation layer are the views organized by scenes.
- Dashboard: View showing the ring with the customer's score.
- Profile: View that shows the complementary information obtained by requesting the endpoint provided.


## Domain layer

In this layer we have three use cases implemented.

- The use case to log the relevant events within the life cycle.
- The use case to obtain the customer's score.
- The use case to obtain the client's report.


## Data layer

In this layer we have the repositories and data sources necessary to satisfy the use cases.

- LogRepository
- ScoreRepository
- ReportRepository


These could scale to persistence or other services without altering the functionality of the project.

To obtain this decoupling we use the principle of Dependency Inversion. Thus being able to switch between data sources without altering the rest of the project.


## Frameworks and Dependencies

This project does not use any external framework. Preferring for a completely native development.

As an external dependency, the project uses [SwiftLint](https://github.com/realm/SwiftLint). It is a Linter that observes the code written by the developer, and applies certain rules to it to improve good practices and apply standardized conventions. In this case, we use the strictest rule model.