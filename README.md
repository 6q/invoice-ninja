# Invoice Ninja
## Simple, Intuitive Invoicing

### [https://invoices.cedase.com](https://invoices.cedase.com)
### Introduction

Most online invoicing sites are expensive. They shouldn't be. The aim of this project is to provide a free, open-source alternative. Additionally, the hope is the codebase will serve as a sample site for Laravel as well as other JavaScript technologies. 

The high level instructions for setting up the site are below but there's also a [setup guide](http://hillelcoren.com/invoice-ninja/laravel-ubuntu-virtualbox/). 

For updates follow [@invoiceninja](https://twitter.com/invoiceninja) or join the [Facebook Group](https://www.facebook.com/invoiceninja). For discussion of the code please use the [Google Group](https://groups.google.com/d/forum/invoiceninja).

If you'd like to translate the site please use [caouecs/Laravel4-long](https://github.com/caouecs/Laravel4-lang) for the starter files.

Site design by [kantorp-wegl.in](http://kantorp-wegl.in/)


### Features
* Core application built using Laravel 4.1
* Invoice PDF generation directly in the browser
* Integrates with many payment providers
* Recurring invoices
* Tax rates and payment terms

### Steps to setup

If you plan on submitting changes it's best to [fork the repo](https://help.github.com/articles/fork-a-repo), otherwise you can just checkout the code.

    git clone git@github.com:hillelcoren/invoice-ninja.git ninja
    cd ninja

Install Laravel packages using Composer

Note: you may be prompted for your Github user/pass due to their API limits. 

    composer install

Configure config/database.php and then initialize the database

    php artisan migrate --seed


### Frameworks/Libraries
* [laravel/laravel](https://github.com/laravel/laravel) - A PHP Framework For Web Artisans
* [twbs/bootstrap](https://github.com/twbs/bootstrap) - Sleek, intuitive, and powerful front-end framework for faster and easier web development.
* [patricktalmadge/bootstrapper](https://github.com/patricktalmadge/bootstrapper) - Laravel Twitter Bootstrap Bundle
* [danielfarrell/bootstrap-combobox](https://github.com/danielfarrell/bootstrap-combobox) - A combobox plugin 
* [jquery/jquery](https://github.com/jquery/jquery) - jQuery JavaScript Library
* [eternicode/bootstrap-datepicker](https://github.com/eternicode/bootstrap-datepicker) - A datepicker for @twitter bootstrap
* [jquery/jquery-ui](https://github.com/jquery/jquery-ui) - The official jQuery user interface library
* [knockout/knockout](https://github.com/knockout/knockout) - Knockout makes it easier to create rich, responsive UIs with JavaScript
* [rniemeyer/knockout-sortable](https://github.com/rniemeyer/knockout-sortable) - A Knockout.js binding to connect observableArrays with jQuery UI sortable functionality
* [MrRio/jsPDF](https://github.com/MrRio/jsPDF) - Generate PDF files in JavaScript. HTML5 FTW.
* [FortAwesome/Font-Awesome](https://github.com/FortAwesome/Font-Awesome) - The iconic font designed for Bootstrap that works with twitter bootstrap
* [jasonlewis/basset](https://github.com/jasonlewis/basset) - A better asset management package for Laravel
* [Zizaco/confide](https://github.com/Zizaco/confide) - Confide is a authentication solution for Laravel 4
* [Anahkiasen/former](https://github.com/Anahkiasen/former) - A powerful form builder, for Laravel and other frameworks (stand-alone too)
* [barryvdh/laravel-debugbar](https://github.com/barryvdh/laravel-debugbar) - Laravel debugbar
* [DataTables/DataTables](https://github.com/DataTables/DataTables) - Tables plug-in for jQuery
* [Chumper/Datatable](https://github.com/Chumper/Datatable) - This is a laravel 4 package for the server and client side of datatables
* [omnipay/omnipay](https://github.com/omnipay/omnipay) - A framework agnostic, multi-gateway payment processing library for PHP 5.3+
* [Intervention/image](https://github.com/Intervention/image) - PHP Image Manipulation
* [webpatser/laravel-countries](https://github.com/webpatser/laravel-countries) - Almost ISO 3166_2, 3166_3, currency, Capital and more for all countries
* [briannesbitt/Carbon](https://github.com/briannesbitt/Carbon) - A simple API extension for DateTime with PHP 5.3+
* [thomaspark/bootswatch](https://github.com/thomaspark/bootswatch) - Themes for Bootstrap
* [mozilla/pdf.js](https://github.com/mozilla/pdf.js) - PDF Reader in JavaScript
* [nnnick/Chart.js](https://github.com/nnnick/Chart.js) - Simple HTML5 Charts using the <canvas> tag
* [josscrowcroft/accounting.js](https://github.com/josscrowcroft/accounting.js) - A lightweight JavaScript library for number, money and currency formatting
* [jashkenas/underscore](https://github.com/jashkenas/underscore) - JavaScript's utility _ belt 
* [caouecs/Laravel4-long](https://github.com/caouecs/Laravel4-lang) - List of languages ​​for Laravel4
* [calvinfroedge/PHP-Payments](https://github.com/calvinfroedge/PHP-Payments) - A uniform payments interface for PHP
