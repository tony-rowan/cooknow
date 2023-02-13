import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-array"
export default class extends Controller {
  static targets = ["item", "form"]

  addItems() {
    this.itemTargets.forEach(item => {
      let hiddenElement = document.createElement("input")
      hiddenElement.type = "hidden"
      hiddenElement.value = item.value
      hiddenElement.name = "search[ingredients][]"
      this.formTarget.appendChild(hiddenElement)
    })
  }
}
