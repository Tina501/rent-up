import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  // On controller's connection, call the flatpickr
  // function in order to build the calendars
  connect() {
    flatpickr(this.startDateInputTarget, {
      plugins: [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }
}
