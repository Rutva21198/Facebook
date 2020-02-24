import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ProfilePhotoBase {

//#region profilePhotoId Prop
        @prop()
        profilePhotoId : number;
//#endregion profilePhotoId Prop


//#region profiePhoto Prop
        @required()
        profiePhoto : string;
//#endregion profiePhoto Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop



}