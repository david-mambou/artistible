const showModal = (event) => {
  event.preventDefault();
  $('#bookingModal').modal('show');
};

const initBookingModal = () => {
  const makeBooking = document.getElementById("new-booking");
  const modifyBooking = document.querySelectorAll('.modify-booking');
  const cancelButton = document.getElementById("cancel-button");

  makeBooking.addEventListener('click', (event) => showModal(event));

  modifyBooking.forEach((button) => {
    button.addEventListener('click', (event) => showModal(event));
  });

  cancelButton.addEventListener('click', (event) => {
    event.preventDefault();
    $('#bookingModal').modal('hide')
  });
};


export { initBookingModal };
