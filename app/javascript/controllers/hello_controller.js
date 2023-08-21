import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    // $(function () {
    //   setTimeout(function () {
    //     $('.hidden-flash').addClass('d-none');
    //   }, 3000);
    // });
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

    //list_member
    $('#multiple-select-field').on('change', function () {
      var selectedUserIds = $(this).val();
      var projectId = $('#list-member').data('project-id');
      $.ajax({
        url: '/projects/list_members',
        type: 'GET',
        dataType: 'script',
        data: { user_ids: selectedUserIds, project_id: projectId },
      });
    });
  }
}
