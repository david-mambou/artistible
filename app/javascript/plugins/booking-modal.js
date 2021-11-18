const showModal = (event) => {
  event.preventDefault();
  $('#bookingModal').modal('show');
};

const initBookingModal = () => {
  const makeBooking = document.getElementById("new-booking");
  const modifyBooking = document.querySelectorAll('.modify-booking');
  const cancelButton = document.getElementById("cancel-button");

  if (makeBooking) {
    makeBooking.addEventListener('click', (event) => {
      event.preventDefault();
      $('.bookingModal').modal('show');
    });
  };

  modifyBooking.forEach((button) => {
    button.addEventListener('click', (event) => showModal(event));
  });

  if (cancelButton) {
    cancelButton.addEventListener('click', (event) => {
      event.preventDefault();
      $('#bookingModal').modal('hide')
    });
  };
};


export { initBookingModal };
