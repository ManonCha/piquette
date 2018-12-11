import "bootstrap";
import "../plugins/flatpickr";
import "../plugins/aos"

import { initNavbar } from "../navbar"
import { displayForm } from "../components/display_form";
import { hideForm } from "../components/hide_form";
import { slide } from "../components/slide";
import { search } from "../components/search";
// import { initDognut } from "../components/dognut_circles";
import { initLine } from "../components/line_when_to_drink_the_bottles";


if (document.getElementById('search')) {
  displayForm()
};

if (document.getElementById('price')) {
  slide();
};

initNavbar();
initDognut();
initLine();

if (document.getElementById('search-btn')) {
  search()
};

// slide
// hideForm();




