import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chartkick"
export default class extends Controller {
  static targets = ["chartkick", "cost"]

  connect() {
    new Chartkick.LineChart(this.chartkickTarget, this.data)
    console.log(this.data)
  }
  test() {
    console.log(this.chartkickTarget)
    new Chartkick.LineChart(this.chartkickTarget, this.data)
  }

  get data() {
    let data = {}
    this.costTargets.forEach((cost) => {
      data[cost.dataset.date] = cost.dataset.value
    })

    return data
  }
}
  