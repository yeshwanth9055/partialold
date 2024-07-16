import { api, LightningElement } from 'lwc';

export default class TestResultViewerEntry extends LightningElement {
    @api item;

    get labelStyle() {
        const { level } = this.item;

        switch (String(level).toUpperCase()) {
            case 'PASSED':
            case 'PASS':
            case 'SUCCESS':
                return 'slds-theme_success';

            case 'FAIL':
            case 'FAILURE':
            case 'FAILED':
            case 'ERROR':
                return 'slds-theme_error';

            case 'WARN':
            case 'WARNING':
                return 'slds-theme_warning';

            default:
                return '';
        }
    }
}