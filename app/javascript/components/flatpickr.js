import { Application } from "stimulus";
import Flatpickr from "stimulus-flatpickr";
import "flatpickr/dist/themes/dark.css";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const initFlatPickr = () => {

const application = Application.start();
  const context = require.context("../controllers", true, /\.js$/);
  application.load(definitionsFromContext(context));
  application.register("flatpickr", Flatpickr);
};

export { initFlatPickr };
