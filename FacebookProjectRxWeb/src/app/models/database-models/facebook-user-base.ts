import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class FacebookUserBase {

//#region userID Prop
        @prop()
        userID : number;
//#endregion userID Prop


//#region firstName Prop
        @required()
        @maxLength({value:50})
        firstName : string;
//#endregion firstName Prop


//#region lastName Prop
        @required()
        @maxLength({value:50})
        lastName : string;
//#endregion lastName Prop


//#region mobileNo Prop
        @required()
        mobileNo : any;
//#endregion mobileNo Prop


//#region email Prop
        @required()
        @maxLength({value:50})
        email : string;
//#endregion email Prop


//#region password Prop
        @required()
        @maxLength({value:200})
        password : string;
//#endregion password Prop


//#region dateOfBirth Prop
        @required()
        dateOfBirth : Date;
//#endregion dateOfBirth Prop


//#region genderAO Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        genderAO : number;
//#endregion genderAO Prop


//#region createdDateTime Prop
        @required()
        createdDateTime : any;
//#endregion createdDateTime Prop

}