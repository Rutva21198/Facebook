import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostBase {

//#region postId Prop
        @prop()
        postId : number;
//#endregion postId Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region media Prop
        @required()
        media : string;
//#endregion media Prop


//#region createdDateTime Prop
        @required()
        createdDateTime : any;
//#endregion createdDateTime Prop


//#region mediaTypeAO Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        mediaTypeAO : number;
//#endregion mediaTypeAO Prop

}