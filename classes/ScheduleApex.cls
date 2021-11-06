global with sharing class ScheduleApex implements Schedulable {
    global void execute(SchedulableContext sc){
        
        //calling the batch apex
        //BatchApex batch = new BatchApex();
        //Database.execute(batch);
    }
}


//Call from dev console.
//ClassName cn = new ClassName();
//String cornExpression = "0 0/1 * 1/1 * ? *";
//String jobID = System.schedule('Name it',cornExpression,cn);