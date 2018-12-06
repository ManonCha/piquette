import "bootstrap";

import { initNavbar } from "../components/navbar"
import {displayForm} from "../components/display_form";
import {hideForm} from "../components/hide_form";

if (document.getElementById('search')) {
  displayForm()
}


initNavbar();



hideForm();



