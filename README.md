# Talk to Me

## Overview

It is a server-less Web application built using `AngularDart` and `WebRTC` where you can:

* Make a video call
* Create an agenda for the call
* Collaborate during the call

## Dart and AngularDart

`Dart` is a new platform for Web development that includes a language, tools, and libraries. `AngularDart` is a framework that enables building rich client-side applications. 

## Goal

The goal of this project is to be a sample application that can help you get started with `AngularDart`. I began working on it a few days ago to learn the framework. And since there is not much documentation about `AngularDart`, I decided to make it public, so others can benefit from it.
 
## AngularDart Tutorial Wiki

I found [AngularDart wiki](https://github.com/angular/angular.dart.tutorial/wiki) being extremely useful. Check it out.

## Work in Progress

The project is still very much a work in progress.

## Done

* Controllers, Components
* Routing

## To do

* Transclusion
* Testing
* Validations
* Application state management
* Shadow DOM
* Use factory, value, CreationStrategy, and Visibility
* Configuring injectables
* HTTP

## Index

* Working with Shadow DOM => `toggle.html` and `toggle_component.dart`
* Building a component => `agenda.html`, `agenda_item.html`, , `agenda_component.dart`, `agenda_component_input.dart`
* Setting up route (including default) => `app_route_initializer.dart`
* Nested routes and nested views => `list.html`, and `app_route_initializer.dart`
* Using RouteProvider => `show_call_ctrl.dart`
* Using filters => `agenda.html` and `list.html`
* Registering components, controllers, and other injectables => talk_to_me.dart
* Creating services => `parse_agenda_item.dart`, `storage.dart`