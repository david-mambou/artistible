import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const startTimeInput = document.getElementById('start_time');
  const endTimeInput = document.getElementById('end_time');

  if (startTimeInput && endTimeInput) {
    flatpickr("#start_time", {
      enableTime: true,
      dateFormat: "Y-m-d H",
      minDate: new Date().fp_incr(3),
      maxDate: new Date().fp_incr(90),
      onChange: function(selectedDates, selectedDate) {
        if (selectedDate === '') {
          endTimeInput.disabled = true;
        };
      let minDate = selectedDates[0];
      endDate.set('minDate', minDate);
      endTimeInput.disabled = false;
  }})
    const endDate =
      flatpickr(endTimeInput, {
        enableTime: true,
        dateFormat: "Y-m-d H"
});}}

// const initFlatpickr = () => {
//   flatpickr(".datepicker", {});
// }

export { initFlatpickr };
