import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class EducationDetailBase {

//#region educationId Prop
        @prop()
        educationId : number;
//#endregion educationId Prop


//#region courseName Prop
        @required()
        @maxLength({value:100})
        courseName : string;
//#endregion courseName Prop


//#region collegeSchoolName Prop
        @maxLength({value:200})
        collegeSchoolName : string;
//#endregion collegeSchoolName Prop


//#region universityBoardName Prop
        @maxLength({value:200})
        universityBoardName : string;
//#endregion universityBoardName Prop


//#region city Prop
        @maxLength({value:50})
        city : string;
//#endregion city Prop


//#region schoolCollegeAO Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        schoolCollegeAO : number;
//#endregion schoolCollegeAO Prop


//#region courseStartDate Prop
        @required()
        courseStartDate : Date;
//#endregion courseStartDate Prop


//#region courseEndDate Prop
        @required()
        courseEndDate : Date;
//#endregion courseEndDate Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop

}