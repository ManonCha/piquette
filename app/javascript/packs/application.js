import "bootstrap";


import { initNavbar } from "../navbar"
import {displayForm} from "../components/display_form";
import {hideForm} from "../components/hide_form";
import {slide} from "../components/slide";
import {photo} from "../components/photo";
import {search} from "../components/search";
>>>>>>> master
import "../plugins/flatpickr";
import "../plugins/aos"

import { initNavbar } from "../navbar"
import { displayForm } from "../components/display_form";
import { hideForm } from "../components/hide_form";
import { slide } from "../components/slide";
import { search } from "../components/search";
import { initDognut } from "../components/dognut_circles";
import { initLine } from "../components/line_when_to_drink_the_bottles";
import { initHorizontalBarChart } from "../components/horizontal_bars_wine_regions";


if (document.getElementById('search')) {
  displayForm()
};

if (document.getElementById('price')) {
  slide();
};

initNavbar();
initDognut();
initLine();
initHorizontalBarChart();

if (document.querySelector('.bottle-modal-photo')) {
  photo();
};

if (document.getElementById('search-btn')) {
  search()
};


// initNavbar();


// slide
// hideForm();




