import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets =[ "source", "passengers", "passengerNumber"]

    add() {
        let passengerNumber = Number(this.passengerNumberTarget.innerHTML);
        passengerNumber++;
        this.passengerNumberTarget.innerHTML = passengerNumber;

        
        this.passengersTarget.insertAdjacentHTML("beforeend", this.templateContent);
    }

    remove() {
        let passengerNumber = Number(this.passengerNumberTarget.innerHTML);

        if (passengerNumber == 1) {
            alert("You can't remove the last passenger.")
            return
        }

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