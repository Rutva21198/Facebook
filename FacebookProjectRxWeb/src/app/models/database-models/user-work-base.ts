import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UserWorkBase {

//#region userWorkId Prop
        @prop()
        userWorkId : number;
//#endregion userWorkId Prop


//#region workName Prop
        @required()
        @maxLength({value:100})
        workName : string;
//#endregion workName Prop


//#region workDescription Prop
        @prop()
        workDescription : string;
//#endregion workDescription Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region workStartDate Prop
        @prop()
        workStartDate : Date;
//#endregion workStartDate Prop


//#region workEndDate Prop
        @prop()
        workEndDate : Date;
//#endregion workEndDate Prop

}