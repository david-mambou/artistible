import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const startTimeInput = document.getElementById('start_time');
  const endTimeInput = document.getElementById('end_time');

  flatpickr("#start_time", {
    enableTime: true,
    dateFormat: "Y-m-d H",
    minDate: new Date().fp_incr(3),
    maxDate: new Date().fp_incr(90) } )
    // onChange: function(selectedDates, selectedDate) {
    //   if (selectedDate === '') {
    //     endTimeInput.disabled = true;
    //       }
    //     }
    //   }
    // )

  console.log("Hello");
}

// const initFlatpickr = () => {
//   flatpickr(".datepicker", {});
// }

export { initFlatpickr };
