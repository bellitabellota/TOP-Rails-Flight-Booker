import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets =[ "source", "passengers", "passengerNumber"]

    add() {
        console.log("Add passenger")
        
        let passengerNumber = Number(this.passengerNumberTarget.innerHTML);
        passengerNumber++;
        this.passengerNumberTarget.innerHTML = passengerNumber;

        
        this.passengersTarget.insertAdjacentHTML("beforeend", this.templateContent);
    }

    private

    get templateContent() {
        return this.sourceTarget.innerHTML.replace(/__INDEX__/g, Date.now());
    }
}