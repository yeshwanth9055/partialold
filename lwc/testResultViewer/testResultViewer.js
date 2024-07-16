import { api, LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

import { parseFileContents } from './parsers';
import readFile from '@salesforce/apex/TestResultViewerReadFile.readFile';


export default class TestResultViewer extends LightningElement {
    @api recordId;

    firstRenderedCallback=true;
    @track
    scans = [];
    @track
    generalMessage = '';

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.recordId = currentPageReference.attributes.recordId;
        }
    }

    renderedCallback() {
        if(this.firstRenderedCallback && this.recordId) {
            this.firstRenderedCallback = false;
            readFile({objectId: this.recordId})
                .then(result => {
                    const scans = parseFileContents(result.data);
                    this.scans.push(...scans);
                    if( !scans.length && result.contentDocumentId) {
                        this.generalMessage = `Cannot display the result. You can still <a href="/lightning/r/ContentDocument/${result.contentDocumentId}/view">view it</a>`;
                    }
                })
                .catch(error => {
                    console.error('readFile error:', error);
                    this.generalMessage = `Could not read the Result. ${error?.body?.message || error} ... You can check the Files related list and check for the result.`;
                });
        }
    }
}