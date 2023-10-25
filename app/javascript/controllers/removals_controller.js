import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {

  connect() {
    // Trigger the custom fade-out animation
    this.fadeOut();
  }

  fadeOut() {
    const element = this.element;
    const duration = 4000; // Animation duration in milliseconds
    const start = performance.now();

    function step(timestamp) {
      const progress = (timestamp - start) / duration;
      element.style.opacity = 1 - progress;

      if (progress < 1) {
        requestAnimationFrame(step);
      } else {
        element.remove(); // Remove the element after the animation is complete
      }
    }

    requestAnimationFrame(step);
  }
}
