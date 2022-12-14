// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import TogglePlantsController from "./toggle_plants_controller"
application.register("toggle-plants", TogglePlantsController)

import TypedJsController from "./typed_js_controller"
application.register("typed-js", TypedJsController)

import WeatherController from "./weather_controller"
application.register("weather", WeatherController)
