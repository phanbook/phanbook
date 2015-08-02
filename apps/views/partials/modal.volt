<div aria-hidden="true" role="dialog" tabindex="-1" id="request-subscribe" class="modal fade" style="display: none;">
    <div id="subscibe" class="modal-dialog">
        <div class="modal-content">
            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
            <h4 id="exampleModalLabel" class="modal-title">Subscribe to the {{this.config.application.name}} weekly newsletter</h4>
            <p><strong><a href="/login">Create an account on {{this.config.application.name}}</a> or <a href="/login">log in</a> if you already have one.</strong></p>
          <div class="modal-body">
            {{ form('subscribe-weekly', 'class': 'form-inline')}}
                <div class="form-group">
                    <label class="control-label" for="email">{{ t('Or, send newsletter emails to') }}:</label>
                    <input type="text" name="email" id="email" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">{{ t('Subscribe') }}</button>
            </form>
          </div>

        </div>
    </div>
</div>
