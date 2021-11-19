import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const startTimeInput = document.querySelectorAll('.start_time');
  const endTimeInput = document.querySelectorAll('.end_time');

  if (startTimeInput && endTimeInput) {
    const endDate = [];
    startTimeInput.forEach((start, index) => {
      flatpickr(start, {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        minuteIncrement: 60,
        minDate: new Date().fp_incr(3),
        maxDate: new Date().fp_incr(90),
        onChange: function(selectedDates, selectedDate) {
          if (selectedDate === '') {
            endTimeInput[index].disabled = true;
          };
        let minDate = selectedDates[0];
        endDate[index].set('minDate', minDate);
        endTimeInput[index].disabled = false;
      }});
      endDate[index] =
        flatpickr(endTimeInput[index], {
          enableTime: true,
          minuteIncrement: 60,
          dateFormat: "Y-m-d H:i"
    });
});}}

// const initFlatpickr = () => {
//   flatpickr(".datepicker", {});
// }

export { initFlatpickr };
