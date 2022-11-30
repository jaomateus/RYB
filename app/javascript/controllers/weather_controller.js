import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["address", "city", "date", "description", "temperature", "icon"]

  initialize() {
    this.apiKey = "ceac9ed2a1f27829a6487c172ea91beb"
  }

  fetchWeather(event) {
    const city = this.addressTarget.dataset.addressValue
    console.log(city)
    fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${this.apiKey}&units=metric`)
      .then(response => response.json())
      .then(data => this.#updateCard(data))
  }

  fetchWeatherByCoordinates(event) {
    event.preventDefault()
    navigator.geolocation.getCurrentPosition((data) => {
      fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=${this.apiKey}&units=metric`)
        .then(response => response.json())
        .then(data => console.log(data))
    })
  }

  #updateCard(data) {
    this.iconTarget.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`
    this.temperatureTarget.innerText = `${Math.round(data.main.temp)} °C`
    this.descriptionTarget.innerText = data.weather[0].description
    this.cityTarget.innerText = data.name
    const today = new Date();
    const localOffset = data.timezone + today.getTimezoneOffset() * 60
    const localDate = new Date(today.setUTCSeconds(localOffset))
    const options = { weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' }
    const formattedDate = localDate.toLocaleDateString("en-US", options)
    this.dateTarget.innerText = formattedDate
  }
}
