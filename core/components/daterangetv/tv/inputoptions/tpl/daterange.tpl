<div id="tv-input-properties-form{$tv}"></div>
{literal}

<script type="text/javascript">
    // <![CDATA[
    var params = {
        {/literal}{foreach from=$params key=k item=v name='p'}
        '{$k}': '{$v|escape:"javascript"}'{if NOT $smarty.foreach.p.last}, {/if}
        {/foreach}{literal}
    };
    var oc = {
        'change': {
            fn: function () {
                Ext.getCmp('modx-panel-tv').markDirty();
            }, scope: this
        }
    };

    MODx.load({
        xtype: 'panel',
        layout: 'form',
        cls: 'form-with-labels',
        autoHeight: true,
        border: false,
        labelAlign: 'top',
        labelSeparator: '',
        items: [{
            xtype: 'combo-boolean',
            fieldLabel: _('required'),
            description: MODx.expandHelp ? '' : _('required_desc'),
            name: 'inopt_allowBlank',
            hiddenName: 'inopt_allowBlank',
            id: 'inopt_allowBlank{/literal}{$tv}{literal}',
            value: params['allowBlank'] == 0 || params['allowBlank'] == 'false' ? false : true,
            width: 200,
            listeners: oc
        }, {
            xtype: MODx.expandHelp ? 'label' : 'hidden',
            forId: 'inopt_allowBlank{/literal}{$tv}{literal}',
            html: _('required_desc'),
            cls: 'desc-under'
        }, {
            xtype: 'textfield',
            fieldLabel: '{/literal}{$daterangetv.dateFormat}{literal}',
            description: MODx.expandHelp ? '' : '{/literal}{$daterangetv.dateFormatDesc}{literal}',
            name: 'inopt_dateFormat',
            id: 'inopt_dateFormat{/literal}{$tv}{literal}',
            value: params['dateFormat'] || '',
            width: 200,
            listeners: oc
        }, {
            xtype: MODx.expandHelp ? 'label' : 'hidden',
            forId: 'inopt_dateFormat{/literal}{$tv}{literal}',
            html: '{/literal}{$daterangetv.dateFormatDesc}{literal}',
            cls: 'desc-under'
        }],
        renderTo: 'tv-input-properties-form{/literal}{$tv}{literal}'
    });
    // ]]>
</script>
{/literal}