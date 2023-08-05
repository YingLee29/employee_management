import { Controller } from '@hotwired/stimulus';
import 'select2';

export default class extends Controller {
  connect() {
    $(function () {
      console.log(123);
      setTimeout(function () {
        $('.hidden-flash').addClass('d-none');
      }, 3000);
    });
  }
}
