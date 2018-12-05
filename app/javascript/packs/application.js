import "bootstrap";
import { initNavbar } from "../navbar"

import {displayForm} from "../components/display_form";
import {hideForm} from "../components/hide_form";

if (document.getElementById('search')) {
  displayForm()
}
  hideForm()

initNavbar();

const quantity = document.getElementById('quantity_field')
const bottle = document.querySelector('.user_bottle_add')

