import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    console.log(123);
    $(function () {
      setTimeout(function () {
        $('.hidden-flash').addClass('d-none');
      }, 3000);
    });
  }
}
