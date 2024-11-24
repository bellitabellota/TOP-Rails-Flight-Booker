import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets =[ "source", "passengers", "passengerNumber"]

    add() {
        console.log("Add passenger")
        
        let passengerNumber = Number(this.passengerNumberTarget.innerHTML)
        passengerNumber++
        this.passengerNumberTarget.innerHTML = passengerNumber
        
        const clone = this.sourceTarget.content.cloneNode(true);
        this.passengersTarget.append(clone)
    }
}