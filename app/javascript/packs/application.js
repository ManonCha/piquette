import "bootstrap";

import { initNavbar } from "../navbar"
import {displayForm} from "../components/display_form";
import {hideForm} from "../components/hide_form";
import "../plugins/flatpickr";
import "../plugins/aos"
import {initDognut} from "../components/dognut_circles"
import {initLine} from "../components/line_when_to_drink_the_bottles"

if (document.getElementById('search')) {
  displayForm()
}


initNavbar();
initDognut();
initLine();



// hideForm();



