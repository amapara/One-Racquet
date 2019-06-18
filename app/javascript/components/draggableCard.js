// remember to "yard add interactjs"
import interact from 'interactjs'

const draggableCardInit = () => {
  interact('.box')
    .draggable({
      // enable inertial throwing
      inertia: true,
      // call this function on every dragmove event
      onstart: dragStartListener,
      onmove: dragMoveListener,
      // call this function on every dragend event
      onend: function (event) {
        const distanceMoved = event.pageX - event.x0;
        const message = `moved a distance of ${distanceMoved}px`;
        console.log(message)

        // translate the element
        var target = event.target;

        // translate the element
        target.style.webkitTransform =
        target.style.transform = 'translate(0px, 0px)';
        target.style.transition = 'transform 1s ease';

        // update the posiion attributes
        target.setAttribute('data-x', 0);
        target.setAttribute('data-y', 0);

        const maxDistance = 150;
        if(distanceMoved > maxDistance) {
          // load route, offers/:id/bookings/new
          window.location = target.dataset.bookingPath
        } else if(distanceMoved < -maxDistance) {
          target.style.transform = 'translate(-500vw, 0px)';
        }
      }
    });

    function dragStartListener (event) {
      var target = event.target;
      target.style.removeProperty("transition")
    }

    function dragMoveListener (event) {
      var target = event.target,
          // keep the dragged position in the data-x/data-y attributes
          x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
          y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

      // translate the element
      target.style.webkitTransform =
      target.style.transform =
        'translate(' + x + 'px, ' + y + 'px)';

      // update the posiion attributes
      target.setAttribute('data-x', x);
      target.setAttribute('data-y', y);
    }

    // this is used later in the resizing and gesture demos
    window.dragMoveListener = dragMoveListener;
}

export { draggableCardInit }
