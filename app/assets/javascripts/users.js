
$(document).on('ready page:load', function () {
$('#users').DataTable({
  // ajax: ...,
  autoWidth: true,
  // autoWidth: false,
  // pagingType: 'full_numbers',
  // processing: true,
  // serverSide: true,

  // Optional, if you want full pagination controls.
  // Check dataTables documentation to learn more about available options.
  // http://datatables.net/reference/option/pagingType
});
});

$(document).on('ready page:load', function () {
$('#users1').DataTable({
  // ajax: ...,
  autoWidth: true,
  // pagingType: 'full_numbers',
  // processing: true,
  // serverSide: true,

  // Optional, if you want full pagination controls.
  // Check dataTables documentation to learn more about available options.
  // http://datatables.net/reference/option/pagingType
});
});

console.log('test');