public with sharing class FutureApex {
    public FutureApex() {

    }
    
    @future
    public static void methodOne() {
        System.debug('method1');
    }
    
    //only need to add @future to the method and it will be executed asynchronously
    //callout = true means can be used with the webservice...
    @future(callout = true)
    public static void methodTwo() {
        System.debug('method2');
    }
}
