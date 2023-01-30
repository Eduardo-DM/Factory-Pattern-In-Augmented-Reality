# Factory-Pattern-In-Augmented-Reality
A demonstrator of Factory pattern in Augmented Reality context. Goal is create a set of predefined virtual objects and manipulate them without knowledge of RealityKit.

## About factory pattern
User can choose the creation of two basic shapes of virtual objects: a cube or a sphere. These objects have a basic setting to be manipulated with gestures (drag, rotation, ...) or not. Hence there are four possible objects / products that can be created.

With the factory pattern approach these predefined virtual objects are created on consistent way and anyone may create them without any knowledge of Realitykit with intuitive calls.
 Created virtual objects aka "Products" with the factory pattern are conformed to VirtualObject protocol

<img width="316" alt="Captura de Pantalla 2023-01-30 a las 13 33 57" src="https://user-images.githubusercontent.com/93383384/215478479-01c1fd8f-bdc4-409e-be5b-dac9a103ade3.png">


This is the call of the creation of a sphere with gestures with the factory pattern

<img width="351" alt="Captura de Pantalla 2023-01-30 a las 13 35 46" src="https://user-images.githubusercontent.com/93383384/215478820-3f706c0f-5ef6-48d5-a750-62b2011f166a.png">

And these are the required lines of code in RealityKit to create the sphere with gestures

<img width="690" alt="Captura de Pantalla 2023-01-30 a las 13 37 37" src="https://user-images.githubusercontent.com/93383384/215479135-3dd932fb-ed96-43df-8778-e8f8477aa1ce.png">

It's really easier, faster and intuitive the first way.

## About the protocol to manipulate objects
Two features are added to the objects/products created by the factory pattern to grant a way to manipulate objects with "classic" calls: change the height and change the color.
It also allows add some checks, for example: it checks height never goes behind the "ground"

This is the call to change the color with protocol related to the factyory pattern (a random color is the new one)

<img width="885" alt="Captura de Pantalla 2023-01-30 a las 13 30 13" src="https://user-images.githubusercontent.com/93383384/215479271-92858a50-b314-4e88-9343-c23f545ab390.png">

This is how RealityKit change color under the hood

<img width="578" alt="Captura de Pantalla 2023-01-30 a las 13 27 21" src="https://user-images.githubusercontent.com/93383384/215479631-cc3e8764-b537-4bb1-8361-e053efdf639e.png">

This is the call to change the height with protocol related to the factyory pattern

<img width="260" alt="Captura de Pantalla 2023-01-30 a las 13 41 02" src="https://user-images.githubusercontent.com/93383384/215479789-cfdef2c6-fddb-488c-9f76-39ec243323a5.png">

This is how RealityKit change height under the hood

<img width="453" alt="Captura de Pantalla 2023-01-30 a las 13 27 44" src="https://user-images.githubusercontent.com/93383384/215479526-7422d946-3781-4f8b-97e2-830519ae2ceb.png">

Thought saiving in lines of code is limited and RealityKit lines seems intuive while you are reading them...to code you previously need dig in the ModelEntity documentation to figure out how change this stuff. I chose these ones to get an easy to understand demostrator.
And the height check allows the project incorporate this is consistency check (we could consider a behaviour bug if the object starts going down our ground)

## About interface

While system is detecting the plane user receives feedback from ARCoaching. Once it is detected, inputs to system comes from user detecting taps and other gestures (if allowed by virtual object on the screen and SwitUI controls; obviously the movement of the device is other input.

### ARCoaching
When app is lanched while the base plane is detected, ARCoacing is used to give feedback to the user

Once the plane is detected, control goes to user.

### Selection of type of virtual object
User selects the type of virtual object in a Picker
### Creation of an virtual object
The virtual object is created with a tap in the screen. Where? on the point of tap
### Interaction with objects
Once the virtual object is shown, some buttons to control it are displayed. We can change height or color, also delete the object. Gestures like drag are recognized if virtual object allows them.
