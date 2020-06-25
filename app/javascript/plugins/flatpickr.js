import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


$( document ).on('turbolinks:load', function() {

 flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})],
    enableTime: true,
    dateFormat: "Y-m-d H:i"
      
  });
});
