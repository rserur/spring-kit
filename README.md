[SpringKit](http://springkit.herokuapp.com)
==========

[![Build Status](https://travis-ci.org/rserur/spring-kit.svg)](https://travis-ci.org/rserur/spring-kit)
[![Code Climate](https://codeclimate.com/github/rserur/spring-kit.png)](https://codeclimate.com/github/rserur/spring-kit)
[![Coverage Status](https://coveralls.io/repos/rserur/spring-kit/badge.png)](https://coveralls.io/r/rserur/spring-kit)

What is SpringKit?
-------------------
SpringKit is a social media application for counselors, therapists, and other healthcare practitioners that helps actively engage clients in collecting resources related to ongoing treatment. 

It provides a private space (a "SpringKit") for clients to save helpful PDFs, documents, images, or video that a practitioner can also view and contribute to. Either party can also send posts as text messages for quick communication.

![Screencast](/screencast.gif)

Project Information
-------------------
"SpringKit" is a proof-of-concept final project, or "Breakable Toy", for my apprenticeship at Launch Academy in Summer 2014.

Features
-------------------
1. Private resource-sharing ("kits") for clients and their practitioners
2. Sharing messages and media, including PDFs, links, images, and videos
3. "Send Post as Text Message" option for both client and practitioner from within kit
4. A WYSIWYG editor for body text
5. A namespaced practitioner dock
    - Listing of all of practitioner's clients and their kits
    - Kit creation
    - Message center for texted posts from all clients
    - Area graph of post frequency for each kit
    - Date of last post for each kit
6. Customized "collections" unique to each kit, to group posts categorically according to each client's unique needs
7. Kit searching
8. Clients and practitioners can belong to "organizations", so that multiple organizations can use SpringKit

Technologies Used
-------------------
- This Ruby on Rails app was stitched together with Paperclip, the Twilio API, PostGRES, jQuery, Devise, Froala WYSIWYG, and Chartkick
- ...tested with Capybara, FactoryGirl, Webmock, and VCR
- ...and Sass-styled with the aid of Bourbon mixins, the Neat grid framework,  and Bitters scaffolding
