import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const startDateInput = document.getElementById("start_time");
  const endDateInput = document.getElementById("end_time");

if (startDateInput && endDateInput) {
  flatpickr(startDateInput, {
    enableTime: true,
    dateFormat: "Y-m-d H",
    minDate: new Date().fp_incr(3),
    maxDate: new Date().fp_incr(80),
    onChange: function (selectedDates, selectedDate) {
      if (selectedDate ==="") {
        endDateInput.disabled = true;
      }
      }
    }

  });

  flatpickr("#end_time", {
    enableTime: true,
    dateFormat: "Y-m-d H",
    minDate: new Date().fp_incr(3),
    maxDate: new Date().fp_incr(80),
  });

}
}

export { initFlatpickr };
