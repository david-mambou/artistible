const showModal = (event) => {
  event.preventDefault();
  $('#bookingModal').modal('show');
};

const initBookingModal = () => {
  const makeBooking = document.getElementById("new-booking");
  const modifyBooking = document.querySelectorAll('.modify-booking');
  console.log(modifyBooking);
  // use data attribute
  const cancelButton = document.getElementById("cancel-button");

  if (makeBooking) {
    makeBooking.addEventListener('click', (event) => {
      event.preventDefault();
      $('#bookingModal').modal('show');
    });
  };

  modifyBooking.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      $(`#booking-${button.dataset.bookingid}`).modal('show');
    });
  });

  if (cancelButton) {
    cancelButton.addEventListener('click', (event) => {
      event.preventDefault();
      $('#bookingModal').modal('hide')
    });
  };
};


export { initBookingModal };
