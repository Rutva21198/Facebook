import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class CoverPhotoBase {

//#region coverPhotoId Prop
        @prop()
        coverPhotoId : number;
//#endregion coverPhotoId Prop


//#region coverPhoto Prop
        @required()
        coverPhoto : string;
//#endregion coverPhoto Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop



}