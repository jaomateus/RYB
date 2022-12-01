import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hello, its working")
  }

  open() {
    this.formTarget.classList.remove("d-none")
  }

  close(event) {
    this.formTarget.classList.add("d-none")
    console.log(event)
  }
}
