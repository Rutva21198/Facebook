import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ApplicationObjectTypeBase {

//#region applicationObjectITypeId Prop
        @prop()
        applicationObjectITypeId : number;
//#endregion applicationObjectITypeId Prop


//#region applicationObjectTypeName Prop
        @required()
        @maxLength({value:100})
        applicationObjectTypeName : string;
//#endregion applicationObjectTypeName Prop

}