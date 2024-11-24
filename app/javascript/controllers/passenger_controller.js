import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets =[ "source", "passengers"]

    add() {
        console.log("Add passenger")
        const clone = this.sourceTarget.content.cloneNode(true);
        this.passengersTarget.append(clone)
    }
}