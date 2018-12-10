import "bootstrap";

import { initNavbar } from "../navbar"
import {displayForm} from "../components/display_form";
import {hideForm} from "../components/hide_form";
import {slide} from "../components/slide";
import "../plugins/flatpickr";
import "../plugins/aos"

if (document.getElementById('search')) {
  displayForm()
};

slide();

initNavbar();

// slide



