import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UserDetailBase {

//#region userDetailId Prop
        @prop()
        userDetailId : number;
//#endregion userDetailId Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region currentCity Prop
        @maxLength({value:30})
        currentCity : string;
//#endregion currentCity Prop


//#region homeTown Prop
        @maxLength({value:50})
        homeTown : string;
//#endregion homeTown Prop


//#region relationshipAO Prop
        @prop()
        relationshipAO : number;
//#endregion relationshipAO Prop


//#region bio Prop
        @prop()
        bio : string;
//#endregion bio Prop


//#region profilePhotoId Prop
        @prop()
        profilePhotoId : number;
//#endregion profilePhotoId Prop


//#region coverPhotoId Prop
        @prop()
        coverPhotoId : number;
//#endregion coverPhotoId Prop







}