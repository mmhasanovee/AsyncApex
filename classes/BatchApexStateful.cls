global with sharing class BatchApexStateful implements Database.Batchable<SObject>, Database.Stateful{
    
    private Integer numCounter = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id, Name From Account');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accounts){
        //In the batch Apex
        Integer i = 0;
        List<Account> updatedAc = new List<Account>();
        for(Account account : accounts){
            System.debug('Account: ' + account.Name);
            account.Name = 'Mewmew' + i ;
            i++;
            updatedAc.add(account);
            numCounter++;
        }
        
        update updatedAc;
    }
    
    global  void finish(Database.BatchableContext bc){
        System.debug('Batch finished');
        System.debug(numCounter);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'study.ovee@gmail.com'};
        //Assign the TO address to our mail object
        mail.setToAddresses(toAddresses);
        mail.setSubject('All the account values are updated with Mewmew..');
        //Specify any html - for example this will display a link in the email
        mail.setHtmlBody('Records are updated!!');
        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}
