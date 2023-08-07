import { Controller } from '@hotwired/stimulus';
import 'select2';

export default class extends Controller {
  connect() {
    $(function () {
      setTimeout(function () {
        $('.hidden-flash').addClass('d-none');
      }, 3000);
      //select2
      $('#multiple-select-field').select2({
        theme: 'bootstrap-5',
        width: $(this).data('width')
          ? $(this).data('width')
          : $(this).hasClass('w-100')
          ? '100%'
          : 'style',
        placeholder: $(this).data('placeholder'),
        closeOnSelect: false,
      });
    });
  }
}
