package ProjectsPatterns.Strukturalne.Adapter;
public class Main {
    public static void main(String[] args) {
        INotificationSender iNotificationSender = new EmailSender();
        iNotificationSender.SendNotification(1,new Notification("a","ciało tekstu email "));
//        INotificationSender iNotificationSender2 = new PushSender();
        INotificationSender iNotificationSender3 = new SMSSenderAdapter();
        iNotificationSender3.SendNotification(2,new Notification("b","ciało sms "));
    }
}
class SmsSender{
    public void SendSMS(String to, String text){
        System.out.println("Sending SM to "+to+" ");
    }
}
interface INotificationSender{
    void SendNotification(int userid, Notification notification);
}
class Notification{
    String title;
    String body;
    Notification(String title, String body){
        this.title = title;
        this.body = body;
    }
}
class SMSSenderAdapter implements INotificationSender{
    private SMSSender smsSender = new SMSSender();
    @Override
    public void SendNotification(int userid, Notification notification) {
        String userPhoneNumber = null; // na podstawie userID
        smsSender.SendSMS(userPhoneNumber, notification.title+notification.body);
    }
}
class SMSSender{
    public void SendSMS(String to, String text) {
        System.out.println("Sending SMS noticifaction to "+to+" text : "+text);
    }
}
class EmailSender implements INotificationSender {
    @Override
    public void SendNotification(int userid, Notification notification) {
        System.out.println("Sending email noticifaction to " + userid + "title " + notification.title + " " + notification.body);
    }
}
class PushSender implements INotificationSender{
    @Override
    public void SendNotification(int userid, Notification notification) {
        System.out.println("Sending push noticifaction to "+userid+"title "+notification.title+ " "+ notification.body);
    }
}