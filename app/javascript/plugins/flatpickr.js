import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
import { French } from "flatpickr/dist/l10n/fr.js";


$( document ).on('turbolinks:load', function() {

 flatpickr("#range_start", {
    
    plugins: [new rangePlugin({ input: "#range_end"})],
   
    dateFormat: "d-m-Y",
    
  });
});
