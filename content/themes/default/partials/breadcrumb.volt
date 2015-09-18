<!-- .breadcrumb -->
<div class="container">
    <ul class="breadcrumb">
        <li>{{ link_to('', '<i class="fa fa-home"></i> Home</a>') }}</li>
        <li>{{ link_to(this.view.getControllerName(), '<i class="fa fa-list-ul"></i> ' ~ this.view.getControllerName() | capitalize) }}</li>
        <li class="active">{{ this.view.getActionName() | capitalize }}</li>
    </ul>
</div>
<!-- / .breadcrumb -->
