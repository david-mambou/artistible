import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const startTimeInput = document.getElementById('start_time');
  const endTimeInput = document.getElementById('end_time');

  if (startTimeInput && endTimeInput) {
    flatpickr(startTimeInput, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minuteIncrement: 60,
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
        minuteIncrement: 60,
        dateFormat: "Y-m-d H:i"
});}}

// const initFlatpickr = () => {
//   flatpickr(".datepicker", {});
// }

export { initFlatpickr };
