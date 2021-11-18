const initBookingModal = () => {
  const makeBooking = document.getElementById("new-booking");
  const cancelButton = document.getElementById("cancel-button");

  makeBooking.addEventListener('click', (event) => {
    event.preventDefault();
    $('#newBookingModal').modal('show')
  });

  cancelButton.addEventListener('click', (event) => {
    event.preventDefault();
    $('#newBookingModal').modal('hide')
  });
};

export { initBookingModal };
