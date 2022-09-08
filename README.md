# BigBurger


## Overview

Assessment test.

Xcode project that fetches data to showcase a list of the best burgers 
in town that you can buy from the Big Burger restaurant.



## Technics

BigBurger is a Xcode project, written in Swift and is using the SwiftUI
framework for the User Interface.

It is an iOS application that can be run on iPhones with a minimal 
version of iOS 15. 



## Architecture

The project is with a MVVM architecture.

As the project is too small, the MVVM architecture is kept inside the Features folder. 

Technically, the Features folder would start decoupling the MVVM architecture, which 
is set in the root of the BigBurger folder, into a Clean architecture to separate concerns
and to decouple features as blocks to easily manage them separately.



## Getting Started

- Open the BigBurgerApple.xcodeproj file using Xcode.
- Select the BigBurger Development scheme.
- Run the project on the desired simulator.



## Unit Tests

Unit tests are used with Test Plans.

- Select the BigBurger Development or Production scheme. 
- Press `⌘ + U` to run all tests.

the BigBurger Development Scheme run the Development.xctestplan. 
the BigBurger Production Scheme run the Production.xctestplan. 
