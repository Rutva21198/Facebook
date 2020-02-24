import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostMessageBase {

//#region postMessageId Prop
        @prop()
        postMessageId : number;
//#endregion postMessageId Prop


//#region message Prop
        @required()
        message : string;
//#endregion message Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region postDateTime Prop
        @required()
        postDateTime : any;
//#endregion postDateTime Prop

}