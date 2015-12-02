<tr>
    <td width="1%">
        <label class="checkbox m-n i-checks">
            <input type="checkbox"><i></i>
        </label>
    </td>
    <!-- start content -->
    <td> {{ row.getFileName() }}</td>
    <td> {{ row.getPathName() }}</td>
    <td> {{ folder }}</td>
    <!-- end content -->
    <td class="text-center">
        {{ link_to('#', '<i class="fa fa-edit"></i>', 'title' : t('Edit entry'), 'class': 'js-edit', 'data-filepath' : row.getPathName() , 'data-filename' : row.getFileName()) }}

        {{ link_to( '#', '<i class="fa fa-trash-o"></i>', 'title' : t('Delete entry'), 'data-toggle' : 'tooltip', 'data-placement' : 'bottom', 'onclick' : "return confirm('Are you sure you want to delete this entry?')") }}
    </td>
</tr>
