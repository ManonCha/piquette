import "bootstrap";

import { initNavbar } from "../navbar"

import {displayForm} from "../components/display_form";
import {hideForm} from "../components/hide_form";
import {slide} from "../components/slide";
import {photo} from "../components/photo";
import {autoscroll} from "../components/autoscroll";
import {close_reload} from "../components/close_reload";
import {search} from "../components/search";
import {check_wish} from "../components/check_wish";
import {blur} from "../components/blur";
import "../plugins/flatpickr";
import "../plugins/aos"
import { initDognut } from "../components/dognut_circles";
import { initLine } from "../components/line_when_to_drink_the_bottles";
import { initHorizontalBarChart } from "../components/horizontal_bars_wine_regions";

blur();

if (document.getElementById('usr-modal')) {
  close_reload()
};

if (document.getElementById('search')) {
  displayForm()
};
if (document.getElementById('reco-index')) {
  // check_wish();
};
if (document.getElementById('price')) {
  slide();
};

if (document.getElementById('ans-one')) {
  autoscroll();
};

if (document.getElementById('bottle_charts')) {
  initDognut();
};

if (document.getElementById('bottle_lines')) {
  initLine();
};

if (document.getElementById('regions_wine')) {
  initHorizontalBarChart();
};

if (document.querySelector('.bottle-modal-photo')) {
  photo();
};

if (document.getElementById('search-btn')) {
  search()
};







