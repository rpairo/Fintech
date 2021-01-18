#  Fintech

Portfolio application created to pass the selection process

<table>
  <tr>
    <td>Dashboard</td>
    <td>Profile</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/14141324/104879445-25beef00-595e-11eb-827c-a375f1b48800.PNG"></td>
    <td><img src="https://user-images.githubusercontent.com/14141324/104879488-38d1bf00-595e-11eb-9765-e17af8d21dde.PNG"></td>
  </tr>
 </table>

## Architecture

The app is built according to the principles of Clean Architecture.

![Clean Architecture](https://user-images.githubusercontent.com/14141324/104879300-e2648080-595d-11eb-81e3-1716c6d09038.jpg)

In the Presentation layer are the views organized by scenes.

- Dashboard: View showing the ring with the customer's score.
- Profile: View that shows the complementary information obtained by requesting the endpoint provided.

As a design pattern it uses MVVM together with SwiftUI.