import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostCaptionBase {

//#region postCaptionId Prop
        @prop()
        postCaptionId : number;
//#endregion postCaptionId Prop


//#region caption Prop
        @required()
        caption : string;
//#endregion caption Prop


//#region postId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        postId : number;
//#endregion postId Prop

}