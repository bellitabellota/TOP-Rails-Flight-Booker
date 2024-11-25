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

    remove() {
        console.log("remove")
        let passengerNumber = Number(this.passengerNumberTarget.innerHTML);
        passengerNumber--;
        this.passengerNumberTarget.innerHTML = passengerNumber;

        const lastChild = this.passengersTarget.lastElementChild;
        this.passengersTarget.removeChild(lastChild);
    }

    private

    get templateContent() {
        return this.sourceTarget.innerHTML.replace(/__INDEX__/g, Date.now());
    }
}